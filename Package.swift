// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "AppAuthInterop",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)  // يدعم iOS فقط
    ],
    products: [
        .library(
            name: "AppAuthInterop",
            targets: ["AppAuthInterop"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/openid/AppAuth-iOS.git",
            from: "2.0.0"
        ),
        .package(
            url: "https://github.com/the-best-is-best/IOSCryptoInterop.git",
            from: "1.0.0"
        ),
    ],
    targets: [
        .target(
            name: "AppAuthInterop",
            dependencies: [
                .product(name: "AppAuth", package: "AppAuth-iOS"),
                .product(name: "IOSCryptoInterop", package: "IOSCryptoInterop"),

            ],
            path: "Sources/AppAuthInterop",  // تأكد من المسار الصحيح
            resources: [],

            swiftSettings: [
                .define("PLATFORM_IOS", .when(platforms: [.iOS]))
                // .unsafeFlags([
                //     "-emit-objc-header",
                //     "-emit-objc-header-path", "./Headers/KAppAuthIntrop-Swift.h",
                // ]),
            ]
        )
    ]
)
