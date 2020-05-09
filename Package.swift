// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KamaalUI",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6),
    ],
    products: [
        .library(name: "KamaalUI", targets: ["KamaalUI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "KamaalUI", dependencies: []),
        .testTarget(name: "KamaalUITests", dependencies: ["KamaalUI"]),
    ]
)
