
#include "Wrapper.h"
#include <cstdio>
#include <string>

cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage, std::string& errorMessage) {
    try {
        // OpenCV's stitcher (exposure compensation) requires 1- or 3-channel
        // images. UIImageToMat yields 4-channel RGBA on iOS, so drop the alpha
        // channel here. We keep RGB channel order so the stitched result renders
        // with correct colors when converted back via MatToUIImage.
        for (auto& image : images) {
            if (image.channels() == 4) {
                cv::cvtColor(image, image, cv::COLOR_RGBA2RGB);
            }
        }
        cv::Ptr<cv::Stitcher> stitcher = cv::Stitcher::create();
        cv::Stitcher::Status status = stitcher->stitch(images, outImage);
        return status;
    } catch (const cv::Exception& e) {
        // Capture the OpenCV error so it can be surfaced to Swift instead of
        // crashing the process across the C++/Swift boundary.
        errorMessage = e.what();
        fprintf(stderr, "cvStitch: caught cv::Exception: %s\n", e.what());
        return cv::Stitcher::ERR_NEED_MORE_IMGS;
    } catch (const std::exception& e) {
        errorMessage = e.what();
        fprintf(stderr, "cvStitch: caught std::exception: %s\n", e.what());
        return cv::Stitcher::ERR_NEED_MORE_IMGS;
    }
}

