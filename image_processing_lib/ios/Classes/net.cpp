#include "net.hpp"

Model::~Model()
{
    _interpreter->releaseModel();
    _interpreter->releaseSession(_session);
}

bool Model::loadModel(std::string modelPath_)
{
    _interpreter = std::unique_ptr<MNN::Interpreter>(MNN::Interpreter::createFromFile(modelPath_.c_str()));

    MNN::ScheduleConfig config;
    config.numThread = _params.numThread;
    config.type = static_cast<MNNForwardType>(MNN_FORWARD_CPU);
    MNN::BackendConfig backendConfig;
    backendConfig.precision = (MNN::BackendConfig::PrecisionMode)2;
    config.backendConfig = &backendConfig;

    _session = _interpreter->createSession(config);

    return true;
}

bool Model::setParameters(int numThread_, MNN::CV::ImageFormat srcFormat_, MNN::CV::ImageFormat dstFormat_,
                          std::string outputLayerName_, std::vector<float> meanValues_, std::vector<float> normalValues_)
{
    _params.numThread = numThread_;
    _params.srcFormat = srcFormat_;
    _params.dstFormat = dstFormat_;
    _params.outputLayerName = outputLayerName_;

    std::copy(meanValues_.begin(), meanValues_.end(), _params.meanValues);
    std::copy(normalValues_.begin(), normalValues_.end(), _params.normalValues);

    return true;
}

std::shared_ptr<float> Model::inference(cv::Mat img_)
{
    if(img_.empty())
        return nullptr;

    MNN::Tensor *inTensor = _interpreter->getSessionInput(_session, nullptr);
    _interpreter->resizeTensor(inTensor, 1, img_.channels(), img_.rows, img_.cols);
    _interpreter->resizeSession(_session);

    std::unique_ptr<MNN::CV::ImageProcess> process(
            MNN::CV::ImageProcess::create(
                    _params.srcFormat,
                    _params.dstFormat,
                    _params.meanValues, 3,
                    _params.normalValues, 3
            ));
    process->convert((const unsigned char *)img_.data, img_.cols, img_.rows, img_.step[0], inTensor);

    _interpreter->runSession(_session);
    return decode();
}

std::shared_ptr<float> Model::decode()
{
    if(strcmp(_params.outputLayerName.c_str(), "") == 0)
        return nullptr;

    MNN::Tensor *outTensor = _interpreter->getSessionOutput(_session, _params.outputLayerName.c_str());
    std::unique_ptr<MNN::Tensor> hostTensor(new MNN::Tensor(outTensor, outTensor->getDimensionType(), true));
    outTensor->copyToHostTensor(hostTensor.get());
    MNN::Tensor *tensor = hostTensor.get();
    auto size = tensor->elementSize();
    std::shared_ptr<float> outPtr(new float[(size + 1) * sizeof(float)], std::default_delete<float[]>());

    outPtr.get()[0] = size;
    ::memcpy(outPtr.get() + 1, tensor->host<float>(), size * sizeof (float));
    return outPtr;
}
