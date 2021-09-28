
# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# #The iOS Simulator deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of supported deployment target versions is 9.0 to 14.0.99
# post_install do |installer|
#      installer.pods_project.targets.each do |target|
#          target.build_configurations.each do |config|
#              config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
#              config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
#              config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
#          end
#      end
#   end

###############################################################
############# CommonUI COMMON CocoaPods #################
def commonUIPods
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!

  pod 'FLEX'

end
###############################################################

###############################################################
# AppStore CommonUI.app 
###############################################################
target 'CommonUI' do
  commonUIPods
end
