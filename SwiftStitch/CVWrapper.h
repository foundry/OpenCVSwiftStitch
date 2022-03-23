//
//  CVWrapper.h
//  CVOpenTemplate
//
//  Created by Washe on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface CVWrapper : NSObject

+ (nullable UIImage*) processWithImage: (UIImage*) image error:(NSError**)error;

+ (nullable UIImage*) processWithImage1:(UIImage*)image1 image2:(UIImage*)image2 error:(NSError**)error;

+ (nullable UIImage*) processWithImages:(NSArray<UIImage*>*)images error:(NSError**)error;


@end
NS_ASSUME_NONNULL_END
