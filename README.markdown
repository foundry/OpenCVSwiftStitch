__OpenCV computer vision with iOS: stitching panoramas__  

<img src = "https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/example.big.jpg">

Version 5.0 of [OpenCVStitch](http://github.com/foundry/OpenCVStitch) - updated for Swift 5.0  + OpenCV 4.3  
See appropriate branches and tags for Swift 2.x - 4.x

This project was created to a answer a couple of Stack Overflow questions:  
[libraries to CAPTURE panorama in iOS](http://stackoverflow.com/q/14062932/1375695)  
[Can I mix Swift with C++? Like the Objective - C .mm files](http://stackoverflow.com/q/24042774/1375695)    

v2 demonstrates how to mix Swift, Objective-C and C++ in one project whilst keeping the code clearly separate. 

The project AppDelegate and View Controller are written in Swift. Swift cannot talk directly to C++ (which we need for OpenCV), so we provide an Objective-C++ wrapper class to mediate between Swift and C++. We also provide an Objective-C++ category on UIImage to mediate between UIImage and CV::Mat image formats. The CVWrapper header file is pure Objective-C. For [v1](https://github.com/foundry/OpenCVStitch)(which doesn't use Swift) this separation was a matter of clean style. For v2, it is a requirement: if any C++ headers are included in the wrapper, the app will not compile (Swift won't like it).

__Installation__  
To run the project you need to install the OpenCV framework using Cocoapods    

Assuming you have first [installed CocoaPods](https://guides.cocoapods.org/using/getting-started.html), run 'pod install' in this directory to install OpenCV for the project. From then on, always open the project in XCode from the `SwiftStitch.xcworkspace` file that the pod install creates. 

The podfile will install openCV v4.3.0. 


__Use__  
OpenCVStitch is a very simple iOS/openCV example showing basic use of the Stitcher class. The c++ code is adapted from a sample included with the openCV distribution.  

The app has almost no user interface. On launch, the stitching code operates on four sample images, displaying the result in a UIScrollView.

__OpenCVStitch Versions__   
[Version 5.0](https://github.com/foundry/OpenCVSwiftStitch/releases/tag/5.0)  
Swift / Objective-C / C++   
OpenCV 4.3  
Tested with XCode 12.0 / Swift 5.0 for iOS 9.0+  
[Version 4.0](https://github.com/foundry/OpenCVSwiftStitch/releases/tag/4.0)   
Swift / Objective-C / C++   
Tested with XCode 10.0 / Swift 4.2 for iOS 8.0+  
[Version 3.0](https://github.com/foundry/OpenCVSwiftStitch/releases/tag/3.0)   
Swift / Objective-C / C++   
Tested with XCode 8.0 / Swift 3.0 for iOS 8.0+  
[Version 2.1](https://github.com/foundry/OpenCVSwiftStitch)   
Swift / Objective-C / C++   
Tested with XCode 7.0 / Swift 2.0 for iOS 7.0+  
[Version 2.0](https://github.com/foundry/OpenCVSwiftStitch/tree/v2.0)   
Swift / Objective-C / C++   
Tested with XCode 6.4 / Swift 1.2 for iOS 7.0+  
[Version 1.0](https://github.com/foundry/OpenCVStitch)  
Objective-C / C++   
Tested with XCode 4.5.2 -> 6.3 for iOS 5.1 upwards   

Provides a partial answer to: [Libraries to capture panoramas in iOS 6](http://stackoverflow.com/questions/14062932/libraries-to-capture-panorama-in-ios-6/14064788#14064788) (Stack Overflow)

__OpenCV Versions__  
_OpenCV 3.x_   
The podfile installs a hotfixed version of 3.1 as the prebuilt binary provided by openCV  [breaks on arm64 devices](https://github.com/kylefleming/opencv/releases/tag/3.1.0-ios-fix).

The stitching seems to be much more efficient (85% faster on my iphone 5s). However the quality is noticeably inferior with the test images supplied, so v2.4x remains the default for now [_some improvement with openCV 3.1_].

_OpenCV 2.4.x_  
The openCV distribution is not as clean as we would like.  
2.4.10 - the pod spec and the distribution build for iOS [is broken](http://stackoverflow.com/questions/28331397/cocoapods-opencv-2-4-10-linker-error/28820510)  
2.4.9 - the pod spec [is broken](http://stackoverflow.com/questions/31005022/cant-install-opencv-with-cocoapods-could-not-resolve-host-hivelocity-dl-sourc). This is likely a result of relying on Sourceforge for hosting.  

Therefore we are using a [self-hosted podspec](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV) (_thanks Matteo!_) until official channels are fixed. Specs are available for [2.4.9](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV/2.4.9-zp) and [2.4.10](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV/2.4.10-zp), but as the latter won't run we use 2.4.9.

_this version of OpenCVStitch opted to use cocoapods to overcome the [notorious](http://stackoverflow.com/q/13905471/1375695) [installation](http://stackoverflow.com/q/15855894/1375695) [issues](http://stackoverflow.com/a/14186883/1375695) with previous versions of the openCV 2.4.x framework.. it seems our optimism was slightly premature!_

__XCode 10__  

Project is now updated for Swift 4.1 and XCode 10. For backwards compatibility checkout the 2.0 / 2.1 branches, 3.0 release or refer to the Objective-C version v1.0.

__Comparisons__

<table><tr>
<td>OpenCV 2.4.9</td><td>OpenCV 3.0.0</td><td>OpenCV 3.1.0</td>
</tr><tr>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v2_inset2.jpg" width="300" height="375" alt="v2_inset2">


</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3_inset2.jpg" width="300" height="375" alt="v2_inset2">


</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3.1_inset2.jpg" width="300" height="375" alt="v2_inset2">


</td>
</tr><tr>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v2_inset.jpg" width="300" height="375" alt="v2_inset2">

</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3_inset.jpg" width="300" height="375" alt="v2_inset2">

</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3.1_inset.jpg" width="300" height="375" alt="v2_inset2">

</td>
</tr></table>
