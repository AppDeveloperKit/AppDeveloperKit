
# We specify --source in order to be able to find dependencies such as FastStart_Bonjour
#
# pod spec lint FastStart_Config.podspec --sources=https://github.com/scottcarter/Specs,https://github.com/CocoaPods/Specs.git
# pod lib lint FastStart_Config.podspec --sources=https://github.com/scottcarter/Specs,https://github.com/CocoaPods/Specs.git

Pod::Spec.new do |s|
s.name              = 'FastStart_Config'
s.version           = '1.1.3'
s.summary           = 'NA'
s.homepage          = 'http://example.com'

s.author            = { 'Name' => 'Scott Carter' }
s.license           = { :type => 'Custom', :file => 'LICENSE' }


s.platform          = :ios

s.ios.deployment_target = '10.3'

# Example of 3rd party dependencies
#s.dependency 'AFNetworking'
#s.dependency 'SVProgressHUD'


# Binary install.
#
s.ios.vendored_frameworks = 'FastStart_Config.framework'

# Local testing
# s.source            = { :http => 'http://127.0.0.1/FastStart_Config/FastStart_Config.framework.zip' }

s.source            = { :git => 'https://github.com/scottcarter/FastStart_Config.git', :tag => s.version.to_s }


# Dependencies on other frameworks I maintain.
s.dependency 'FastStart_Bonjour', '1.1.2'
s.dependency 'FastStart_Utils', '1.1.1'



end

