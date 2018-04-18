// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "UIWebKit",
    products: [
        .library(name: "UIWebKit", targets: ["UIWebKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc")
    ],
    targets: [
        .target(name: "UIWebKit", dependencies: ["Vapor"]),
        .testTarget(name: "UIWebKitTests", dependencies: ["UIWebKit", "Vapor"])
    ]
)
