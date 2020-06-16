// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabStriper",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "TabStriper",
            targets: ["TabStriper"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TabStriper",
            dependencies: []),
        .testTarget(
            name: "TabStriperTests",
            dependencies: ["TabStriper"]),
    ]
)
