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
 
 C++ wrapper to work around Swift-C++ type issues

 */

using stdVectorOfCvMat = std::vector<cv::Mat>;

cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage);


#endif
