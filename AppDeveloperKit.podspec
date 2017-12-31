# pod spec lint AppDeveloperKit.podspec --sources=https://github.com/CocoaPods/Specs.git
# pod lib lint AppDeveloperKit.podspec --sources=https://github.com/CocoaPods/Specs.git

Pod::Spec.new do |s|
s.name              = 'AppDeveloperKit'
s.version           = '1.0.2'
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
# s.source            = { :http => 'http://127.0.0.1/AppDeveloperKit/FastStart_Config.framework.zip' }

s.source            = { :git => 'https://github.com/AppDeveloperKit/AppDeveloperKit.git', :tag => s.version.to_s }


# Dependencies on other frameworks I maintain.
s.dependency 'AppDeveloperKit-Bonjour', '1.0.0'
s.dependency 'AppDeveloperKit-Utils', '1.0.1'



end

