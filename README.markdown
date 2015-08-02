__OpenCV computer vision with iOS: stitching panoramas__  

<img src = "https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/example.big.jpg">

Version 2.0 of [OpenCVStitch](http://github.com/foundry/OpenCVStitch)

This project was created to a answer a couple of Stack Overflow questions:  
[libraries to CAPTURE panorama in iOS](http://stackoverflow.com/q/14062932/1375695)  
[Can I mix Swift with C++? Like the Objective - C .mm files](http://stackoverflow.com/q/24042774/1375695)    

v2 demonstrates how to mix Swift, Objective-C and C++ in one project whilst keeping the code clearly separate. 

The project AppDelegate and View Controller are written in Swift. Swift cannot talk directly to C++ (which we need for OpenCV), so we provide an Objective-C++ wrapper class to mediate between Swift and C++. We also provide an Objective-C++ category on UIImage to mediate between UIImage and CV::Mat image formats. The CVWrapper header file is pure Objective-C. For [v1](https://github.com/foundry/OpenCVStitch)(which doesn't use Swift) this separation was a matter of clean style. For v2, it is a requirement: if any C++ headers are included in the wrapper, the app will not compile (Swift won't like it).

__Installation__  
To run the project you need to install the OpenCV framework:    
v3.0.0: available from [opencv.org](http://opencv.org)  
v2.4.9: installed via cocoaPods

v3.0.0: download the framework and drag it to your project. Include it in the _Link Binary With Libraries_ section of Build Phases for the target.  
v2.4.9: Assuming you have first [installed CocoaPods](https://guides.cocoapods.org/using/getting-started.html), run 'pod install' in this directory to install OpenCV for the project. From then on, always open the project in XCode from the `SwiftStitch.xcworkspace` file that the pod install creates. 

__Use__  
OpenCVStitch is a very simple iOS/openCV example showing basic use of the Stitcher class. The c++ code is adapted from a sample included with the openCV distribution.  

The app has almost no user interface. On launch, the stitching code operates on four sample images, displaying the result in a UIScrollView.

__OpenCVStitch Versions__   
[Version 2.0](https://github.com/foundry/OpenCVSwiftStitch)   
Swift / Objective-C / C++   
Tested with XCode 6.3 / Swift 1.2 for iOS 7.0+  
[Version 1.0](https://github.com/foundry/OpenCVStitch)  
Objective-C / C++   
Tested with XCode 4.5.2 -> 6.3 for iOS 5.1 upwards   

Provides a partial answer to: [Libraries to capture panoramas in iOS 6](http://stackoverflow.com/questions/14062932/libraries-to-capture-panorama-in-ios-6/14064788#14064788) (Stack Overflow)

__OpenCV Versions__  
_OpenCV 3.x_   
OpenCV 3.0.0 has just been released. There is no podspec avaiable, but the framework _does_ just work if you download from http://opencv.org and drag into the project. No need for cocoaPods with this version, and the stitching runs 85% faster on my iphone 5s - but seems to produce less accurate results.

_OpenCV 2.4.x_  
The openCV distribution is not as clean as we would like.  
2.4.10 - the pod spec and the distribution build for iOS [is broken](http://stackoverflow.com/questions/28331397/cocoapods-opencv-2-4-10-linker-error/28820510)  
2.4.9 - the pod spec [is broken](http://stackoverflow.com/questions/31005022/cant-install-opencv-with-cocoapods-could-not-resolve-host-hivelocity-dl-sourc). This is likely a result of relying on Sourceforge for hosting.  

Therefore we are using a [self-hosted podspec](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV) (_thanks Matteo!_) until official channels are fixed. Specs are available for [2.4.9](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV/2.4.9-zp) and [2.4.10](https://github.com/Zi0P4tch0/Specs/tree/master/Specs/OpenCV/2.4.10-zp), but as the latter won't run we use 2.4.9.

_this version of OpenCVStitch opted to use cocoapods to overcome the [notorious](http://stackoverflow.com/q/13905471/1375695) [installation](http://stackoverflow.com/q/15855894/1375695) [issues](http://stackoverflow.com/a/14186883/1375695) with previous versions of the openCV 2.4.x framework.. it seems our optimism was slightly premature!_


__Comparisons__

<table><tr>
<td>OpenCV 2.4.9</td><td>OpenCV 3.0.0</td>
</tr><tr>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v2_inset2.jpg" width="300" height="375" alt="v2_inset2">


</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3_inset2.jpg" width="300" height="375" alt="v2_inset2">


</td>
</tr><tr>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v2_inset.jpg" width="300" height="375" alt="v2_inset2">

</td>
<td>
<img src="https://github.com/foundry/OpenCVSwiftStitch/blob/meta/meta/v3_inset.jpg" width="300" height="375" alt="v2_inset2">

</td>
</tr></table>
