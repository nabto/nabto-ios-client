Pod::Spec.new do |s|
  s.name         = 'NabtoClient'
  s.platform     = :ios, "11.0"
  s.version      = '4.3.1-beta1'
  s.summary      = 'Nabto Client SDK'
  s.description  = <<-DESC
The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well. 

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto Client SDK for iOS comes as a framework that provides a simple Objective C wrapper (NabtoClient.h) for accessing the underlying general Nabto Client SDK. The latter can also be used directly through nabto_client_aph.h. 
DESC
  s.homepage         = 'https://www.nabto.com'
  s.license      =   { :type => 'Commercial', :file => 'LICENSE' }
  s.author       = { 'Nabto' => 'apps@nabto.com' }

  s.source           = { :git => 'https://github.com/nabto/nabto-ios-client.git', :tag => 'v4.3.1-beta1' }

  s.source_files = 'Classes/NabtoClient.h', 'Classes/NabtoClient.mm'
  s.ios.libraries = 'c++', 'stdc++'
  s.dependency  'NabtoAPI', '~> 1.0.0'

  s.preserve_paths = 'Classes/module.modulemap'
  
end

