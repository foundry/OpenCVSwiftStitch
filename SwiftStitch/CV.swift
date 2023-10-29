//
//  CVWrapper.swift
//  SwiftStitch
//
//  Created by jonathan on 08/10/2023.
//  Copyright © 2023 ellipsis.com. All rights reserved.
//

import UIKit

enum ProcessError : Error {
    case EmptyImagesArray
    case SitchingFailed
    case RotationFailed
    case MatConversionToImageFailed
}

struct CV {

    
    public static func process (with images: [UIImage]) throws -> UIImage {
        guard let _ = images.first
        else { throw ProcessError.EmptyImagesArray  }

        var matImages : stdVectorOfCvMat = stdVectorOfCvMat()

        for  image in images {
//                /*
//                 All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
//                 */
            guard let rotatedImage = image.rotate()
            else { throw ProcessError.RotationFailed }
            var mat = cv.Mat()
            UIImageToMat(rotatedImage, &mat, false)
            matImages.push_back(mat)
        }

        var outImage = cv.Mat()
        
        let status = cvStitch(&matImages, &outImage );
        if status.rawValue != 0 {
            throw ProcessError.SitchingFailed
        }
        guard let image = MatToUIImage(outImage)
        else { throw ProcessError.MatConversionToImageFailed }
        return image
    }

}

