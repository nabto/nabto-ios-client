Pod::Spec.new do |s|
  s.name         = 'NabtoClient'
  s.version      = "7.0.1"
  s.summary      = "Nabto 4/Micro Client SDK"
  s.description  = <<-DESC
The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well.

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto 4/Micro Client SDK for iOS comes as a framework that provides a simple Objective C wrapper (NabtoClient.h) for accessing the underlying general Nabto Client SDK. For direct access to all features of the latter, please use the NabtoAPI pod.

NOTE! The version number only reflects the wrapper version: The actual API version of the Nabto 4/Micro Client SDK wrapped is 4.7.0.

This is a legacy product. To use the current generation Nabto platform from iOS, Nabto 5/Edge, you can use the NabtoEdgeClientSwift pod. Read more on https://docs.nabto.com/developer/guides/overview/platform-overview.html and https://docs.nabto.com/developer/guides/get-started/ios/intro.html.
                   DESC
  s.homepage         = 'https://www.nabto.com'
  s.license      = { :type => 'Commercial', :file => 'NabtoClient.framework/LICENSE' }

  s.source           = { :http => "https://downloads.nabto.com/assets/nabto-ios-client/#{s.version}/NabtoClient.framework.zip" }

  # should not be necessary, but fixes lint complaint about missing files (https://github.com/CocoaPods/CocoaPods/issues/4135)
  s.source_files = 'Pod/Classes/**/*', 'NabtoClient.framework/Headers/*.h'

  s.public_header_files = 'NabtoClient.framework/Headers/**/*.h'
  s.author           = { 'nabto' => 'apps@nabto.com' }
  s.ios.deployment_target = '10.0'
  s.ios.preserve_paths = 'NabtoClient.framework'
  s.vendored_frameworks = 'NabtoClient.framework'
  s.ios.libraries = 'c++', 'stdc++'

    # no arm64 simulator support yet in core api (https://github.com/CocoaPods/CocoaPods/issues/10104)
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
