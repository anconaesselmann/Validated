// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Validated",
    platforms: [
        .macOS(.v12),
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Validated",
            targets: ["Validated"]),
    ],
    targets: [
        .target(
            name: "Validated"),
        .testTarget(
            name: "ValidatedTests",
            dependencies: ["Validated"]),
    ]
)
