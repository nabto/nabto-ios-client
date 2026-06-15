// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "NabtoClient",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "NabtoClient", targets: ["NabtoClient"]),
    ],
    targets: [
        .binaryTarget(
            name: "NabtoAPI",
            url: "https://downloads.nabto.com/assets/nabto-libs/v4.9.6/NabtoAPI.xcframework.zip",
            checksum: "e9838e4af1ac1ba1f681dfc472da1293739e5ccf933f59f1363723c3a8ce10b1"
        ),
        .target(
            name: "NabtoClient",
            dependencies: ["NabtoAPI"],
            path: "Sources/NabtoClient",
            publicHeadersPath: "include"
        ),
        .testTarget(
            name: "NabtoClientTests",
            dependencies: ["NabtoClient"],
            path: "Tests/NabtoClientTests"
        ),
    ],
    cxxLanguageStandard: .gnucxx11
)
