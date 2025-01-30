platform :ios, '18.2'
use_frameworks!

target 'CoffeeShopApp' do
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '18.2'
    end
  end
end