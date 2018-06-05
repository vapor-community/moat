// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Moat",
    products: [
        .library(name: "Moat", targets: ["Moat"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc"),
    ],
    targets: [
        .target(name: "Moat", dependencies: ["Vapor", "Leaf"]),
    ]
)
