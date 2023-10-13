//
//  UIImage_extensions.swift
//  SwiftStitch
//
//  Created by jonathan on 10/10/2023.
//  Copyright © 2023 ellipsis.com. All rights reserved.
//

import UIKit
import opencv2


extension UIImage {
    convenience init?(cvMat: cv.Mat) {
        let data = Data(bytes: cvMat.data, count: cvMat.elemSize() * cvMat.total())
        var colorSpace : CGColorSpace
        if (cvMat.elemSize() == 1) {
            colorSpace = CGColorSpaceCreateDeviceGray()
        } else {
            colorSpace = CGColorSpaceCreateDeviceRGB()
        }
        
        let provider = CGDataProvider(data: data as CFData)
        let bitmapInfo : CGBitmapInfo = CGBitmapInfo(rawValue:CGImageAlphaInfo.none.rawValue | CGBitmapInfo.byteOrderDefault.rawValue)
        
        
        
        guard let imageRef = CGImage(width: Int(cvMat.cols),
                                     height: Int(cvMat.rows),
                                     bitsPerComponent: 8,
                                     bitsPerPixel:  8 * cvMat.elemSize(),
                                     bytesPerRow: cvMat.step[0],
                                     space: colorSpace,
                                     bitmapInfo: bitmapInfo,
                                     provider: provider!,
                                     decode: nil,
                                     shouldInterpolate: false,
                                     intent: CGColorRenderingIntent.defaultIntent) else { return nil }
        self.init(cgImage:imageRef)
    }
    
   static func imageFromCvMat(_ cvMat: cv.Mat) -> UIImage? {
        return UIImage.init(cvMat: cvMat)
    }
    
    func toCvMat() -> cv.Mat? {
        guard let cgImage = self.cgImage,
              let colorSpace : CGColorSpace  = cgImage.colorSpace
        else { return nil }
        let cols = Int32(self.size.width);
        let rows = Int32(self.size.height);
            
        let cvMat = cvMatCV_8UC4(rows, cols)
            
        let context = CGContext(data: cvMat.data,
                                width: Int(cols),
                                height: Int(rows),
                                bitsPerComponent: 8,
                                bytesPerRow: cvMat.step[0],
                                space: colorSpace,
                                bitmapInfo:  CGImageAlphaInfo.noneSkipLast.rawValue | CGBitmapInfo.byteOrderDefault.rawValue
        )
        
        context?.draw(cgImage, in: CGRectMake(0, 0, CGFloat(cols), CGFloat(rows)), byTiling: false)
        return cvMat;
    }
    
    func toCvMat3() -> cv.Mat? {
    
        guard var mat = self.toCvMat()
        else {return nil}
        /*
        let colourspace = cv.ColorConversionCodes.COLOR_RGBA2RGB
         
         yields error:
                Type 'cv.ColorConversionCodes' has no member 'COLOR_RGBA2RGB'
         
         */
        /*
         cv.cvtColor(cvInputArray(&mat)  , cvOutputArray(&mat), colourspace,0)

         yields error:
         
             Cannot convert value of type 'cv.InputArray' (aka 'UnsafePointer<cv._InputArray>') to expected argument type 'cv._InputArray'
         
         
         but the signture is

         CV_EXPORTS_W void cvtColor( InputArray src, OutputArray dst, int code, int dstCn = 0 );
         
         pass by reference (InputArray, OutputArray) not pass by value (_InputArray, _OutputArray):

         */
     
        cvCvtColor(&mat)

        return mat
    }
    
    
    
}
