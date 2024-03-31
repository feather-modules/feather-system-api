// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-system-api",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "SystemAPIKit", targets: ["SystemAPIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-api-kit", .upToNextMinor(from: "0.1.0")),
        .package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.9.0")),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
    ],
    targets: [
        
        .target(
            name: "SystemAPIKit",
            dependencies: [
                .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit"),
                .product(name: "FeatherAPIKit", package: "feather-api-kit"),
            ],
            plugins: [
                .plugin(name: "FeatherOpenAPIGenerator", package: "feather-openapi-kit")
            ]
        ),

        .executableTarget(
            name: "TestAPIGenerator",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit"),
                .target(name: "SystemAPIKit"),
            ]
        ),

        .testTarget(
            name: "SystemAPIKitTests",
            dependencies: [
                .target(name: "SystemAPIKit")
            ]
        ),
    ]
)
