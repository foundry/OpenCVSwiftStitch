
#include "Wrapper.h"

cv::Stitcher::Status cvStitch (std::vector<cv::Mat>& images, cv::Mat& outImage) {
    cv::Ptr<cv::Stitcher> stitcher = cv::Stitcher::create();
    cv::Stitcher::Status status = stitcher->stitch(images, outImage);
    return status;
}

