/////////////////////////
/*
 
 // stitching.cpp
 // adapted from stitching.cpp sample distributed with openCV source.
 // adapted by Foundry for iOS
 
 */




#include "stitching.h"
#include <iostream>
#include <fstream>

#include "opencv2/stitching.hpp"


using namespace std;
using namespace cv;

bool try_use_gpu = false;
vector<Mat> imgs;
string result_name = "result.jpg";

void printUsage();
int parseCmdArgs(int argc, char** argv);

cv::Mat stitch (vector<Mat>& images)
{
    imgs = images;
    Mat pano;
    Ptr<Stitcher> stitcher = Stitcher::create();
    Stitcher::Status status = stitcher->stitch(imgs, pano);
    
    if (status != Stitcher::OK)
        {
        cout << "Can't stitch images, error code = " << int(status) << endl;
            //return 0;
        }
    return pano;
}

