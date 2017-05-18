import PackageDescription

let package = Package(
    // Name of Package here:
    name: "UIWebKit",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/calebkleveter/SwiftMark.git", majorVersion: 1, minor: 0)
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

