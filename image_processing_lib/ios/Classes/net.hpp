#ifndef NET_HPP
#define NET_HPP

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include <opencv2/opencv.hpp>

#include "MNN/Interpreter.hpp"
#include "MNN/MNNDefine.h"
#include "MNN/Tensor.hpp"
#include "MNN/ImageProcess.hpp"

typedef struct _Params
{
    int numThread = 1;
    MNN::CV::ImageFormat srcFormat = MNN::CV::BGR;
    MNN::CV::ImageFormat dstFormat = MNN::CV::BGR;
    std::string outputLayerName = "output";
    float meanValues[3] = {123.675f, 116.28f, 103.53f};
    float normalValues[3] = {1.0 / 58.395f, 1.0 / 57.124f, 1.0 / 57.375f};
}Params;

class Model{
public:
    ~Model();
    std::shared_ptr<float> inference(cv::Mat img_);
    bool loadModel(std::string modelPath_);
    bool setParameters(int numThread_, MNN::CV::ImageFormat srcFormat_, MNN::CV::ImageFormat dstFormat_,
                       std::string outputLayerName_, std::vector<float> meanValues_, std::vector<float> normalValues_);
private:
    std::shared_ptr<float> decode();

    std::unique_ptr<MNN::Interpreter> _interpreter;
    Params _params;
    MNN::Tensor _inputTensor;
    MNN::Session *_session;
    std::shared_ptr<float> _result;
};


#endif // NET_HPP
