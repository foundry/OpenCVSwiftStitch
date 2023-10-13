//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//



#import "CVWrapper.h"
#import "UIImage+Rotate.h"

#ifdef __cplusplus
#undef NO
#undef YES
/*
 to use all opencv features, uncomment this line and comment the following two imports.
 */
#import <opencv2/opencv.hpp>

/*
 Importing only the needed features can mitigate against build issues with other parts of openCV
 */
#import <opencv2/stitching.hpp>
#import <opencv2/imgcodecs.hpp>
#import "Wrapper.h"
#endif

//#import <opencv2/opencv.hpp>

