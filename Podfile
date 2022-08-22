
target 'Littman App' do
platform :ios, '13.0'
  use_frameworks!
    pod 'Alamofire'
    pod 'AlamofireImage'
    pod 'SwiftLint'

end

deployment_target = '13.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end