/////////////////////////
/*
 
 // stitching.cpp
 // adapted from stitching.cpp sample distributed with openCV source.
 // adapted by Foundry for iOS
 
 */




#include "Wrapper.h"
#include <iostream>
#include <fstream>




using namespace std;
using namespace cv;

bool try_use_gpu = false;
vector<Mat> imgs;
string result_name = "result.jpg";

void printUsage();
int parseCmdArgs(int argc, char** argv);

cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage) {
    Ptr<Stitcher> stitcher = Stitcher::create();
    Stitcher::Status status = stitcher->stitch(images, outImage);
    return status;
}


void cvCvtColor (cv::Mat& image) {
    cv::cvtColor(image , image , COLOR_RGBA2RGB);
}


cv::Mat  cvMatCV_8UC4(int rows, int cols) {
    return cv::Mat(rows, cols, CV_8UC4);
}

/*
cv::_InputArray cv_inputArray(cv::Mat mat) {
    return mat;
}
cv::_OutputArray cv_outputArray(cv::Mat mat) {
    return  mat;
}

cv::InputArray cvInputArray(cv::Mat& matPtr) {
    return matPtr;
}

cv::OutputArray cvOutputArray(cv::Mat& matPtr) {
    return matPtr;
}

cv::InputArrayOfArrays inputArrayOfArrays(std::vector <cv::Mat> mats) {
    return mats;
}
*/
