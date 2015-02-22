__OpenCV computer vision with iOS: stitching panoramas__  

Version 2.0 of [OpenCVStitch](http://github.com/foundry/OpenCVStitch)

This new version demonstrates how to mix Swift, Objective-C and C++ in one project whilst keeping the code clearly separate. The project starts life in Swift. The AppDelegate and View Controller are written in Swift. Swift cannot talk directly to C++ (which we need for OpenCV), so we provide an Objective-C++ wrapper class to mediate between Swift and C++. We also provide an Objective-C++ category on UIImage to mediate between UIImage and CV::Mat image formats. The CVWrapper header file is pure Objective-C. This is important. If any C++ headers are included here the app will not compile (Swift won't like it).

Version 2.0 uses CocoaPods to import the latest OpenCV framework. Assuming you have first installed CocoaPods, run 'pod install' in this directory to install OpenCV for the project. If you want to try stitching without CocoaPods, take a look at V1.

OpenCVStitch is a very simple iOS/openCV example showing basic use of the Stitcher class. The c++ code is adapted from the c++ samples included with the openCV distribution.  

Version 1.0 is built with XCode 4.5.2 for iOS 5.1/6.0  
Version 2.0 is built with XCode 6.0 beta for iOS 7.0+  

Provides a partial answer to: [Libraries to capture panoramas in iOS 6](http://stackoverflow.com/questions/14062932/libraries-to-capture-panorama-in-ios-6/14064788#14064788) (Stack Overflow)

