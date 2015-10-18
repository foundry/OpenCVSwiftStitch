//
//  UIImage+Rotate.h
//  Foundry
//
//  Created by jonathan on 21/09/2013.
//  Copyright (c) 2013 Foundry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate)

//faster, alters the exif flag but doesn't change the pixel data
- (UIImage*)rotateExifToOrientation:(UIImageOrientation)orientation;


//slower, rotates the actual pixel matrix
- (UIImage*)rotateBitmapToOrientation:(UIImageOrientation)orientation;

- (UIImage*)rotateToImageOrientation;

@end
