//
//  CVWrapper.swift
//  SwiftStitch
//
//  Created by jonathan on 08/10/2023.
//  Copyright © 2023 ellipsis.com. All rights reserved.
//

import Foundation
import CxxStdlib

enum ProcessError : Error {
    case EmptyImagesArray
    case SitchingFailed
    case RotationFailed
    case MatConversionToImageFailed
}

struct CV {

    
    public static func process (with images: [UIImage]) throws -> UIImage {
        os_log("process")
        guard let _ = images.first
        else { throw ProcessError.EmptyImagesArray  }

        var matImages : stdVectorOfCvMat = stdVectorOfCvMat()

        for  image in images {
//                /*
//                 All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
//                 */
            guard let rotatedImage = image.rotate()
            else { throw ProcessError.RotationFailed }
            let matImage = rotatedImage.toCvMat3()!
            matImages.push_back(matImage)
        }

        var outImage = cv.Mat()
        
        let status = cvStitch(&matImages, &outImage );
        if status.rawValue != 0 {
            throw ProcessError.SitchingFailed
        }
        guard let image =  UIImage.imageFromCvMat(outImage)
        else { throw ProcessError.MatConversionToImageFailed }
        return image
    }

}

