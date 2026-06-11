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
            url: "https://downloads.nabto.com/assets/nabto-libs/v4.9.4/NabtoAPI.xcframework.zip",
            checksum: "b66cfc460ca85289c071251bf10d4b09db6f87ce2a5b685e8ec5cba446225456"
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
