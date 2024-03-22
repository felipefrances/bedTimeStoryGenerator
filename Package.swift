// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BedTimeStoryGenerator",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.54.0"),
        .package(url: "https://github.com/google/generative-ai-swift", from: "0.4.8"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "BedTimeStoryGenerator",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "GoogleGenerativeAI", package: "generative-ai-swift"),
            ],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]
        ),
    ]
)

//1.2.0
