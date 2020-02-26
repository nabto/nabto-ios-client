Pod::Spec.new do |s|
  s.name         = 'NabtoClient'
  s.version      = "5.1.1"
  s.summary      = "Nabto Client SDK"
  s.description  = <<-DESC
The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well.

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto Client SDK for iOS comes as a framework that provides a simple Objective C wrapper (NabtoClient.h) for accessing the underlying general Nabto Client SDK. For direct access to all features of the latter, please use the NabtoAPI pod.

The change in major version does not reflect the wrapped Nabto Client SDK: The underlying Nabto Client SDK version is 4.5.0 - but breaking changes have been applied to the wrapper's interface (to not depend on the raw nabto_client_api.h header file from the public wrapper header).
                   DESC
  s.homepage         = 'https://www.nabto.com'
  s.license      = { :type => 'Commercial', :file => 'NabtoClient.framework/LICENSE' }

  s.source           = { :http => "https://downloads.nabto.com/assets/nabto-ios-client/#{s.version}/NabtoClient.framework.zip" }

  # should not be necessary, but fixes lint complaint about missing files (https://github.com/CocoaPods/CocoaPods/issues/4135)
  s.source_files = 'Pod/Classes/**/*', 'NabtoClient.framework/Headers/*.h'

  s.public_header_files = 'NabtoClient.framework/Headers/**/*.h'
  s.author           = { 'nabto' => 'apps@nabto.com' }
  s.ios.deployment_target = '11.0'
  s.ios.preserve_paths = 'NabtoClient.framework'
  s.vendored_frameworks = 'NabtoClient.framework'
  s.ios.libraries = 'c++', 'stdc++'
end
