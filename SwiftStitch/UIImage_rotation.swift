//
//  UIImage_rotation.swift
//  SwiftStitch
//
//  Created by jonathan on 13/10/2023.
//  Copyright © 2023 ellipsis.com. All rights reserved.
//

import UIKit



extension UIImage {
    func rotate() -> UIImage? {
        //https://gist.github.com/therealjohn/c658d6c087847360afdc
    
        // No-op if the orientation is already correct
        if (self.imageOrientation == .up) {
            return self;
        }
        
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform : CGAffineTransform = .identity;
        
        switch (self.imageOrientation) {
        case .down, .downMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, Double.pi);
        case .left, .leftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, Double.pi / 2);
        case .right, .rightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -Double.pi / 2);
        default:
            break
        }
        
        switch (self.imageOrientation) {
        case .upMirrored, .downMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            
        case .leftMirrored, .rightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
        default:
            break
        }
        
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        
        guard  let cgImage = self.cgImage,
               let colorSpace = cgImage.colorSpace
        else { return self }
        guard let context = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height),
                                      bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: cgImage.bitmapInfo.rawValue)
        else { return nil }
        context.concatenate(transform);
        switch (self.imageOrientation) {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(cgImage, in: CGRectMake(0,0,self.size.height,self.size.width), byTiling: false)
        default:
            context.draw(cgImage, in: CGRectMake(0,0,self.size.width,self.size.height), byTiling: false)
        }
        
        // And now we  create a new UIImage from the drawing context
        guard let cgimg = context.makeImage() else { return nil }
        let img = UIImage.init(cgImage: cgimg)
        return img;
    }
}
