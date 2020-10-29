// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SalmonUI",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6),
    ],
    products: [
        .library(name: "SalmonUI", targets: ["SalmonUI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SalmonUI", dependencies: []),
        .testTarget(name: "SalmonUITests", dependencies: ["SalmonUI"]),
    ]
)
