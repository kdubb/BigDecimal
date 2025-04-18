// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigDecimal",
    platforms: [
        .macOS("13.3"), .iOS("16.4"), .macCatalyst("13.3"), .tvOS("16.4"),
        .watchOS("9.4")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BigDecimal",
            targets: ["BigDecimal"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
        .package(url: "https://github.com/kdubb/BigInt.git", branch: "main"),
        .package(url: "https://github.com/mgriebling/UInt128.git", from: "3.1.5"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BigDecimal",
            dependencies: ["BigInt", "UInt128",
                      .product(name: "Numerics", package: "swift-numerics")],
            swiftSettings: [
				.enableExperimentalFeature("StrictConcurrency")
            ]),
        .testTarget(
            name: "BigDecimalTests",
            dependencies: ["BigDecimal"]),
    ],
	swiftLanguageVersions: [.version("6"), .v5]
)

