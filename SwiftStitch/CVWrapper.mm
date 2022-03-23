//
//  CVWrapper.m
//  CVOpenTemplate
//
//  Created by Washe on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#import "CVWrapper.h"
#import "UIImage+OpenCV.h"
#import "stitching.h"
#import "UIImage+Rotate.h"


@implementation CVWrapper

+ (nullable UIImage*) processWithImage: (UIImage*) image error:(NSError**)error;
{
    UIImage* result = [[self class] processWithImages:@[image] error:error];
    return result;
}

+ (nullable UIImage*) processWithImage1:(UIImage*)image1 image2:(UIImage*)image2 error:(NSError**)error;
{
    UIImage* result = [[self class] processWithImages:@[image1, image2] error:error];
    return result;
}

+ (nullable UIImage*) processWithImages:(NSArray<UIImage*>*)images error:(NSError**)error;
{
    if ([images count]==0){
        NSLog (@"imageArray is empty");
        return 0;
        }
    std::vector<cv::Mat> matImages;

    for (id image in images) {
        if ([image isKindOfClass: [UIImage class]]) {
            /*
             All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
             */
            UIImage* rotatedImage = [image rotateToImageOrientation];
            cv::Mat matImage = [rotatedImage CVMat3];
            NSLog (@"matImage: %@",image);
            matImages.push_back(matImage);
        }
    }
    NSLog (@"stitching...");
    cv::Mat stitchedMat;
    try {
        stitchedMat = stitch (matImages);
        UIImage* result =  [UIImage imageWithCVMat:stitchedMat];
        return result;
    } catch (std::invalid_argument& e) {
        if (error) {
            std::string stdErrorMsg = e.what();
            NSString* errorMsg = [NSString stringWithUTF8String:stdErrorMsg.c_str()];
            NSDictionary* userInfo = @{
                NSLocalizedFailureReasonErrorKey : @"Stitching Error",
                NSLocalizedDescriptionKey : errorMsg
            };
            NSError* err = [NSError errorWithDomain:@"SwiftStitchErrorDomain" code:0 userInfo:userInfo];
            *error = err;
        }
        return nil;
    }
}


@end
