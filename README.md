# Nabto Client SDK for iOS

The Nabto communication platform enables you to establish direct connections from a client to even the most resource constrained devices, regardless of the firewall configuration of each peer - a P2P middleware that supports IoT well.

The platform has been designed from the ground and up with strong security as a focal point. All in all, it enables vendors to create simple, high performant and secure solutions for their Internet connected products with very little effort.

The Nabto Client SDK for iOS comes as a Swift package that provides a simple Objective C wrapper (`NabtoClient.h`) for accessing key functionality in the underlying general Nabto Client SDK (`NabtoAPI.xcframework`).

This is a legacy product. To use the current generation Nabto platform from iOS, Nabto 5/Edge, use the [NabtoEdgeClientSwift](https://github.com/nabto/nabto-client-edge-ios) package. Read more on https://docs.nabto.com/developer/guides/overview/platform-overview.html and https://docs.nabto.com/developer/guides/get-started/ios/intro.html.

## Installing

Add the package as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/nabto/nabto-ios-client.git", from: "7.4.0"),
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "NabtoClient", package: "nabto-ios-client"),
        ]
    ),
]
```

Or in Xcode: **File → Add Package Dependencies…** and enter
`https://github.com/nabto/nabto-ios-client.git`.

Then import the module:

```objc
@import NabtoClient;
// or
#import <NabtoClient/NabtoClient.h>
```

## Underlying SDK

The package pulls the `NabtoAPI.xcframework` (Nabto 4/Micro Client SDK, currently 4.9.0) directly from `downloads.nabto.com` as a SwiftPM binary target. No additional setup is required.

## Building and testing

The package targets iOS, so building and running the tests requires a Mac with Xcode 16 (or newer) and an iOS Simulator runtime.

Build:

```sh
xcodebuild build \
    -scheme NabtoClient \
    -destination 'platform=iOS Simulator,name=iPhone 16,OS=latest'
```

Run the tests:

```sh
xcodebuild test \
    -scheme NabtoClient \
    -destination 'platform=iOS Simulator,name=iPhone 16,OS=latest'
```

Note that some tests reach out to `demo.nabto.net` and require network connectivity to pass.

The same build and test commands run automatically on every pull request and on every push to `master` via the GitHub Actions workflow in `.github/workflows/ci.yml`.
