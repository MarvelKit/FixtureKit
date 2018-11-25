// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "FixtureKit",
    products: [
        .library(name: "FixtureKit", targets: ["FixtureKit"]),
    ],
    dependencies: [
        // Dev dependencies
        .package(url: "https://github.com/orta/Komondor.git", from: "1.0.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8"),
    ],
    targets: [
        .target(
            name: "FixtureKit",
            dependencies: []
        ),
        .testTarget(
            name: "FixtureKitTests",
            dependencies: ["FixtureKit"]
        ),
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfig([
    "komondor": [
        "pre-commit": ["swift test", "swift run swiftFormat .", "git add ."],
        "pre-push": "swift test"
    ],
])
#endif