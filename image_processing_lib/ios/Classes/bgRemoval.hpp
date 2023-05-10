#ifndef BGREMOVAL_HPP
#define BGREMOVAL_HPP

#include <string>
#include <vector>
#include <opencv2/opencv.hpp>

#include "MNN/Interpreter.hpp"
#include "MNN/MNNDefine.h"
#include "MNN/Tensor.hpp"
#include "MNN/ImageProcess.hpp"

#include "net.hpp"

class BgRemover
{
public:
    BgRemover(std::string model_path, int input_width, int input_height, int num_thread);
    ~BgRemover();
    cv::Mat removeBg(const cv::Mat img_);
    cv::Mat saveResult(const cv::Mat mask_);

    cv::Mat _org_img;
    cv::Mat rawImg;

private:
    cv::Mat preprocess(cv::Mat img_);
    cv::Mat postprocess();

    std::string _model_path;
    int _num_thread;
    int _output_w;
    int _output_h;
    int _img_w;
    int _img_h;
    std::string _output_layer_name;
    std::vector<float> _mean_values{123.675f, 116.28f, 103.53f};
    std::vector<float> _normal_values{1.0 / 58.395f, 1.0 / 57.124f, 1.0 / 57.375f};
    std::shared_ptr<float> _result;
};

#endif // BGREMOVAL_HPP

