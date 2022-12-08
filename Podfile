# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['DEAD_CODE_STRIPPING'] = 'YES'
  end
end


target 'DomOffOn' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DomOffOn
  pod 'Moya/Combine', '~> 15.0', :inhibit_warnings => true
  pod 'PhoneNumberKit', :git => 'https://github.com/marmelroy/PhoneNumberKit'
  pod 'SnapKit', '~> 5.6.0'
  pod 'SwiftLint', '~> 0.49.1'
  pod 'Swinject', '2.8.2'

end
