// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "app",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "App", targets: ["App"])
    ],
    dependencies: [
        .package(url: "https://github.com/xcode73/feather-core.git", branch: "test-dev"),
        .package(url: "https://github.com/xcode73/user-module.git", branch: "test-dev"),
        .package(url: "https://github.com/xcode73/web-module.git", branch: "test-dev"),
        .package(url: "https://github.com/xcode73/redirect-module.git", branch: "test-dev"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.6.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver.git", from: "1.3.2"),
//        .package(url: "https://github.com/binarybirds/mail-aws-driver.git", from: "0.0.1")
    ],
    targets: [
        .executableTarget(name: "App", dependencies: [
            .product(name: "Feather", package: "feather-core"),
            .product(name: "UserModule", package: "user-module"),
            .product(name: "WebModule", package: "web-module"),
            .product(name: "RedirectModule", package: "redirect-module"),
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
//            .product(name: "MailAwsDriver", package: "mail-aws-driver")
        ]),
    ],
    swiftLanguageVersions: [.v5]
)
