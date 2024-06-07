// swift-tools-version:5.7
import PackageDescription
import Foundation

let package = Package(
    name: "feather",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "Feather", targets: ["Feather"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.7.0"),
        .package(url: "https://github.com/BinaryBirds/liquid-local-driver.git", from: "1.3.2"),
        .package(url: "https://github.com/xcode73/feather-core.git", branch: "main"),
        .package(url: "https://github.com/xcode73/analytics-module.git", branch: "main"),
        .package(url: "https://github.com/xcode73/aggregator-module.git", branch: "main"),
        .package(url: "https://github.com/xcode73/blog-module.git", branch: "main"),
        .package(url: "https://github.com/xcode73/markdown-module.git", branch: "main"),
        .package(url: "https://github.com/xcode73/redirect-module.git", branch: "main"),
        .package(url: "https://github.com/xcode73/swifty-module.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "Feather",
            dependencies: [
                .product(name: "FeatherCore", package: "feather-core"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
                .product(name: "AnalyticsModule", package: "analytics-module"),
                .product(name: "AggregatorModule", package: "aggregator-module"),
                .product(name: "BlogModule", package: "blog-module"),
                .product(name: "RedirectModule", package: "redirect-module"),
                .product(name: "SwiftyModule", package: "swifty-module"),
                .product(name: "MarkdownModule", package: "markdown-module")
            ],
            exclude: [
                "Modules/README.md",
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
    ]
)
