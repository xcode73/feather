// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "app",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "App", targets: ["App"])
    ],
    dependencies: [
//        .package(path: "../feather-core"),
//        .package(path: "../user-module"),
//        .package(path: "../web-module"),
//        .package(path: "../redirect-module"),

        .package(url: "https://github.com/xcode73/feather-core", .branch("test-dev")),
        .package(url: "https://github.com/xcode73/user-module", .branch("test-dev")),
        .package(url: "https://github.com/xcode73/web-module", .branch("test-dev")),
        .package(url: "https://github.com/xcode73/redirect-module", .branch("test-dev")),

        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.6.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.3.2"),
        .package(url: "https://github.com/binarybirds/mail-aws-driver", from: "0.0.2"),
    ],
    targets: [
        .executableTarget(name: "App", dependencies: [
            .product(name: "Feather", package: "feather-core"),
            .product(name: "UserModule", package: "user-module"),
            .product(name: "WebModule", package: "web-module"),
            .product(name: "RedirectModule", package: "redirect-module"),
            
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            .product(name: "MailAwsDriver", package: "mail-aws-driver"),
        ]),
    ]
)
