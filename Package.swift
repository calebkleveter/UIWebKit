import PackageDescription

let package = Package(
    // Name of Package here:
    name: "UIWebKit",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/calebkleveter/SwiftDown.git", majorVersion: 0, minor: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        "Tests",
        ]
)

