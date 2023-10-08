source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'


# Uncomment this line if you're using Swift
use_frameworks!


target 'SwiftStitch' do
  pod 'OpenCV', '4.3.0'
end

# update openCV target iOS version to remove XCode warning
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
