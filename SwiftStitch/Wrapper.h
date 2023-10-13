//
//  stitching.h
//  CVOpenTemplate
//
//  Created by Foundry on 05/01/2013.
//  Copyright (c) 2013 Foundry. All rights reserved.
//

#ifndef Wrapper_h
#define Wrapper_h

#include <opencv2/opencv.hpp>

/*
 
 C++ wrapper functions to work around Swift-C++ type issues
 
 - visibility of OpenCV enums and #defines
 - use of OpenCV proxy classes InputArray and OutputArray

 */

using stdVectorOfCvMat = std::vector<cv::Mat>;

cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage);

void cvCvtColor (cv::Mat& image);

cv::Mat  cvMatCV_8UC4(int rows, int cols);

/*
cv::_InputArray cv_inputArray(cv::Mat);
cv::InputArray cvInputArray(cv::Mat&);
cv::_OutputArray cv_outputArray(cv::Mat);
cv::OutputArray cvOutputArray(cv::Mat&);
cv::InputArrayOfArrays cvInputArrayOfArrays(std::vector <cv::Mat>);
 */
#endif
