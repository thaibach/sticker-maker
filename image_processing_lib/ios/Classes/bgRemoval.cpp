#include "bgRemoval.hpp"
#include <iostream>
/*----------------------------------------------------------------------------*/
static BgRemover *bgRemoval = NULL;
static Model *_net = NULL;
bool model_init_ok = false;

BgRemover::BgRemover(std::string model_path, int input_width, int input_height, int num_thread)
{
    _model_path = model_path;
    _num_thread = num_thread;
    _img_w = input_width;
    _img_h = input_height;
    _output_layer_name = "output";
    _net->setParameters(_num_thread, MNN::CV::ImageFormat::BGR, MNN::CV::ImageFormat::RGB, _output_layer_name,
                        _mean_values, _normal_values);
    _net->loadModel(_model_path);
}

BgRemover::~BgRemover()
{
    _org_img.release();
}

cv::Mat BgRemover::preprocess(cv::Mat img_)
{
    cv::Mat outImg;
    cv::resize(img_, outImg, cv::Size(_img_w, _img_h));
    return outImg;
}

cv::Mat BgRemover::postprocess()
{
    // Get data from output tensor
    cv::Mat outImg = cv::Mat(_img_h, _img_w, CV_32FC1, _result.get() + 1);
    cv::resize(outImg, outImg, _org_img.size());
    // Filter by threshold
    cv::Mat refImg = cv::Mat(outImg.size(), CV_32FC1, cv::Scalar::all(0.5));
    cv::Mat out;
    cv::compare(outImg, refImg, out, cv::CMP_GT);

    cv::Mat erosion, dilation;
    // Erode and keep patch(es) corresponding to erosion = 255
    cv::Mat elem = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(3, 3), cv::Point(1, 1));
    cv::erode(out, erosion, elem, cv::Point(-1, -1), 1);
    cv::Mat temp;
    cv::compare(erosion, cv::Mat::zeros(erosion.size(), erosion.type()), temp, cv::CMP_GT);
    temp /= 255;
    cv::multiply(temp, out, erosion);
    // Dilate and then filter
    elem = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(61, 61), cv::Point(30, 30));
    cv::dilate(erosion, dilation, elem);

    int num_rows = dilation.rows;
    int num_cols = dilation.cols;
    for(int r = 0; r < num_rows; r++) {
        for(int c = 0; c < num_cols; c++) {
            if(erosion.at<uchar>(r, c) > 127) {
                dilation.at<uchar>(r, c) = 255;
            } else {
                dilation.at<uchar>(r, c) = dilation.at<uchar>(r, c) == 255 ? 127 : dilation.at<uchar>(r, c);
                dilation.at<uchar>(r, c) = dilation.at<uchar>(r, c) < 127 ? 0 : dilation.at<uchar>(r, c);
                dilation.at<uchar>(r, c) = dilation.at<uchar>(r, c) > 200 ? 0 : dilation.at<uchar>(r, c);
            }
        }
    }
    elem = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(3, 3), cv::Point(1, 1));
    cv::blur(erosion, out, cv::Size(5, 5));
    // cv::imwrite("/storage/emulated/0/Documents/pictures/after.png", out);
    return out;
}

cv::Mat BgRemover::removeBg(const cv::Mat img_)
{
    if(img_.empty())
        return cv::Mat();
    cv::cvtColor(img_, _org_img, cv::COLOR_BGR2RGBA);
    cv::Mat inImg = preprocess(img_);

    _result = _net->inference(inImg);
    if(_result == nullptr)
        return cv::Mat(img_.size(), CV_8UC1, cv::Scalar::all(255));
    return postprocess();
}

cv::Mat BgRemover::saveResult(cv::Mat mask_)
{
    if(mask_.size() != _org_img.size())
    {
        std::cerr << "ERROR: Invalid mask" << std::endl;
        return cv::Mat();
    }

    cv::Mat channels[4];
    cv::split(_org_img, channels);
    channels[3] = mask_;
    cv::Mat outImg;
    cv::merge(channels, 4, outImg);

    return outImg;
}

//Init model
extern "C" __attribute__((visibility("default"))) __attribute__((used))
bool init_model(char* _modelPath, const int inputWidth, const int inputHeight, const int numMNNThreads)
{
    if (model_init_ok) {
        return true;
    }

    bool is_initModel = false;

    std::string modelPath(_modelPath);
    if (modelPath.empty()) {
        return is_initModel;
    }

    _net = new Model();
    bgRemoval = new BgRemover(modelPath, inputWidth, inputHeight, numMNNThreads);
    model_init_ok = true;
    is_initModel = true;
    return is_initModel;
}

/*----------------------------------------------------------------------------*/
//Destroy model
extern "C" __attribute__((visibility("default"))) __attribute__((used))
bool release_model()
{
    if(!model_init_ok) {
        return true;
    }

    delete _net;
    delete bgRemoval;
    _net = NULL;
    bgRemoval = NULL;
    model_init_ok = false;
    return true;
}

/*----------------------------------------------------------------------------*/
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void make_process_image(char* _imgPath, uint8_t *ptr, const int chosenWidth, const int chosenHeight,char* cachePath) {
    std::string imgPath(_imgPath);

    //cv::Mat rawImg;
    bgRemoval->rawImg = cv::imread(imgPath);
    int newWidth = 1080;
    float ratio = (float)bgRemoval->rawImg.cols / newWidth;
    int newHeight = bgRemoval->rawImg.rows / ratio;
    cv::resize(bgRemoval->rawImg, bgRemoval->rawImg, cv::Size(newWidth, newHeight));
    cv::Mat mask = bgRemoval->removeBg(bgRemoval->rawImg);
    cv::Mat showedImg = bgRemoval->saveResult(mask);
    cv::resize(showedImg, showedImg, cv::Size(chosenWidth, chosenHeight));
    cv::imwrite(cachePath, showedImg);
    uint8_t* dataPointer = reinterpret_cast<uint8_t*>(showedImg.data); // Src
    std::memcpy(ptr, dataPointer, showedImg.rows * showedImg.cols * showedImg.channels() * sizeof(uint8_t));
}

/*----------------------------------------------------------------------------*/
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void make_process_camera_image(uint8_t *ptr, uint8_t *channelY, uint8_t *channelU, uint8_t *channelV, const int bytesPerRow, const int bytesPerPixel, const int oriImgWidth, const int oriImgHeight, const int chosenWidth, const int chosenHeight)
{
    const int shift_24 = 255 << 24;
    int x, y, uvIndex, index;
    int yp, up, vp;
    int r, g, b;
    int rt, gt, bt;

    uint32_t *image = (uint32_t*) malloc(sizeof(uint32_t) * (oriImgWidth * oriImgHeight));

    for(x = 0; x < oriImgWidth; x++){
        for(y = 0; y < oriImgHeight; y++){

            uvIndex = bytesPerPixel * ((int) floor(x/2)) + bytesPerRow * ((int) floor(y/2));
            index = y * oriImgWidth + x;

            yp = channelY[index];
            up = channelU[uvIndex];
            vp = channelV[uvIndex];
            rt = round(yp + vp * 1436 / 1024 - 179);
            gt = round(yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91);
            bt = round(yp + up * 1814 / 1024 - 227);
            r = rt < 0 ? 0 : (rt > 255 ? 255 : rt);
            g = gt < 0 ? 0 : (gt > 255 ? 255 : gt);
            b = bt < 0 ? 0 : (bt > 255 ? 255 : bt);
            image[oriImgHeight * (x + 1) - (y + 1)] = shift_24 | (b << 16) | (g << 8) | r;
        }
    }

    bgRemoval->rawImg = cv::Mat(oriImgWidth, oriImgHeight, CV_8UC4, (unsigned*) image);
    cv::cvtColor(bgRemoval->rawImg, bgRemoval->rawImg, cv::COLOR_RGBA2BGR);
    cv::Mat mask = bgRemoval->removeBg(bgRemoval->rawImg);
    cv::Mat showedImg = bgRemoval->saveResult(mask);
    cv::resize(showedImg, showedImg, cv::Size(chosenWidth, chosenHeight));
    uint8_t* dataPointer = reinterpret_cast<uint8_t*>(showedImg.data); // Src
    std::memcpy(ptr, dataPointer, showedImg.rows * showedImg.cols * showedImg.channels() * sizeof(uint8_t));
    free(image);
}

/*----------------------------------------------------------------------------*/
extern "C" __attribute__((visibility("default"))) __attribute__((used))
bool save_bg_removed_image(char* _oriImgPath, char* _outputPath, uint8_t *maskPtr, const int chosenWidth, const int chosenHeight) {
    try {
        std::string oriImgPath(_oriImgPath);
        std::string outputPath(_outputPath);

        //cv::Mat rawImg;
        //rawImg = cv::imread(oriImgPath);
        int oriWidth = bgRemoval->rawImg.cols;
        int oriHeight = bgRemoval->rawImg.rows;

        cv::Mat mask = cv::Mat(chosenWidth, chosenHeight, CV_8UC1, (unsigned*) maskPtr);
        cv::rotate(mask, mask, cv::ROTATE_90_CLOCKWISE);
        cv::Mat flippedMask;
        cv::flip(mask, flippedMask, 1);
        cv::resize(flippedMask, flippedMask, cv::Size(oriWidth, oriHeight));

        cv::Mat splitOriImg[4];
        cv::split(bgRemoval->rawImg, splitOriImg);
        splitOriImg[3] = flippedMask;
        cv::Mat outImg;
        cv::merge(splitOriImg, 4, outImg);
        cv::imwrite(outputPath, outImg, {cv::IMWRITE_PNG_COMPRESSION, 8});
        return true;
    } catch (...) {
        return false;
    }
}
