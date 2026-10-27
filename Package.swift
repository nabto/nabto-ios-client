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
            url: "https://downloads.nabto.com/assets/nabto-libs/v4.9.11/NabtoAPI.xcframework.zip",
            checksum: "f2cec7d54c020bc46d12acac69b7d51f8f6e4b689e41c828aa50bf9311cc15f4"
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
