// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BuildHappy",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "BuildHappy",
            targets: ["BuildHappy"]
        )
    ],
    targets: [
        .executableTarget(
            name: "BuildHappy"
        )
    ]
)
