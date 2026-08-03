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

/*
 Runs the OpenCV stitching pipeline. OpenCV can raise a cv::Exception from
 inside stitch() (e.g. an internal assertion), and C++ exceptions cannot cross
 into Swift — they abort the process as an "unhandled C++/Objective-C exception".
 So we catch here and hand the message back via errorMessage (empty on success).
 */
cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage, std::string& errorMessage);


#endif
