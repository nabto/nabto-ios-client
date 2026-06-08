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
            url: "https://downloads.nabto.com/assets/nabto-libs/4.9.0/NabtoAPI.xcframework.zip",
            checksum: "51f6d533eaf1e6dea310690365fb8aff6645af496b2f5b98032fa88d6711bc69"
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
