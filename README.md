# Nabto Client SDK for iOS

The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well. 

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto Client SDK for iOS comes as a framework that provides a simple Objective C wrapper (NabtoClient.h) for accessing key functionality in the underlying general Nabto Client SDK. 

The change in major version does not reflect the wrapped Nabto Client SDK: The underlying Nabto Client SDK version is 4.4.0 - but breaking changes have been applied to the wrapper's interface (to not depend on the raw nabto_client_api.h header file from the public wrapper header).

## Installing

The simplest way to use the Nabto Client SDK for iOS is to install through CocoaPods. [An example project](https://github.com/nabto/nabto-cocoapod-demo) demonstrates this using the following pods file:

```
project 'NabtoCocoapodDemo/NabtoCocoapodDemo.xcodeproj/'

platform :ios, '11.0'

def common
  pod 'NabtoClient', '5.0.0'
end

target 'NabtoCocoapodDemo' do
  use_frameworks!
  common
end

target 'NabtoCocoapodDemoTests' do
  use_frameworks!
  common
end
```

## Building yourself

To build the Nabto Client SDK, first install the underlying cross platform Nabto Client SDK through cocoapods:

```
pod install
```

Then open the resulting `NabtoClient.xcworkspace` file.

For building the full framework bundle use by CocoaPods, run `build.sh`.