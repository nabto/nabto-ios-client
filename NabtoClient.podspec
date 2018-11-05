Pod::Spec.new do |s|
  s.name         = 'NabtoClient'
  s.platform     = :ios, "11.0"
  #  s.version      = ENV['IOS_PODS_VERSION_STRING']
  s.version      = "4.3.1-beta1"
  s.summary      = "Nabto Client SDK"
  s.description  = <<-DESC
The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well. 

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto Client SDK for iOS comes as a framework that provides a simple Objective C wrapper (NabtoClient.h) for accessing the underlying general Nabto Client SDK. The latter can also be used directly through nabto_client_aph.h. 
DESC
  s.homepage         = 'https://www.nabto.com'
  s.license      = "MIT"
  s.author       = { "Nabto" => "apps@nabto.com" }

  s.source           = { :git => "git@github.com/nabto/nabto-ios-client.git" }

  s.source_files = "Classes/**/*"
  s.ios.libraries = "c++", "stdc++"

  s.subspec 'NabtoAPI' do |nabto_api|
    nabto_api.source = { :http => "https://downloads.nabto.com/assets/nabto-ios-client-static/4.3.0-beta.1/nabto-libs-ios-static.zip" }
    nabto_api.preserve_paths = 'nabto-libs-ios-static/ios/include/*.h'
    nabto_api.vendored_libraries = "nabto-libs-ios-static/ios/lib/libnabto_client_api_static.a", "nabto-libs-ios-static/ios/lib/libnabto_static_external.a"
    nabto_api.libraries = 'nabto_client_api_static', 'nabto_static_external.a'
    nabto_api.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/nabto-libs-ios-static/ios/include" }
  end

end

