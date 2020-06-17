# pod spec lint AppDeveloperKit.podspec 
# pod lib lint AppDeveloperKit.podspec

Pod::Spec.new do |s|
s.name              = 'AppDeveloperKit'
s.version           = '1.0.11'
s.summary           = 'NA'
s.homepage          = 'https://github.com/AppDeveloperKit/AppDeveloperKit'

s.author            = { 'Name' => 'Scott Carter' }
s.license           = { :type => 'Custom', :file => 'LICENSE' }


s.platform          = :ios

s.ios.deployment_target = '11.0'

# Example of 3rd party dependencies
#s.dependency 'AFNetworking'
#s.dependency 'SVProgressHUD'


# Binary install.
#
s.ios.vendored_frameworks = 'AppDeveloperKit.framework'

# Local testing
# s.source            = { :http => 'http://127.0.0.1/AppDeveloperKit/AppDeveloperKit.framework.zip' }

s.source            = { :git => 'https://github.com/AppDeveloperKit/AppDeveloperKit.git', :tag => s.version.to_s }


# Dependencies on other frameworks I maintain.
s.dependency 'AppDeveloperKit-Bonjour', '1.0.11'
s.dependency 'AppDeveloperKit-Utils', '1.0.11'



end

