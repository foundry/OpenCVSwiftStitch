//
//  UIImage+OpenCV.h
//  OpenCVClient
//
//  Created by Washe on 01/12/2012.
//  Copyright 2012 Washe / Foundry. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

//https://github.com/opencv/opencv/issues/6114#issuecomment-341985659
#ifdef __cplusplus
#undef NO
#undef YES
/*
 to use all opencv features, uncomment this line and comment the following two imports.
 */
//#import <opencv2/opencv.hpp>

/*
 Importing only the needed features can mitigate against build issues with other parts of openCV
 */
#import <opencv2/stitching.hpp>
#import <opencv2/imgcodecs.hpp>


#endif
#import <UIKit/UIKit.h>
@interface UIImage (OpenCV)

    //cv::Mat to UIImage
+ (UIImage *)imageWithCVMat:(const cv::Mat&)cvMat;
- (id)initWithCVMat:(const cv::Mat&)cvMat;

    //UIImage to cv::Mat
- (cv::Mat)CVMat;
- (cv::Mat)CVMat3;  // no alpha channel
- (cv::Mat)CVGrayscaleMat;

@end
