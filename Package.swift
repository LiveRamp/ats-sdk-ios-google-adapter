// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "LRAtsMediationAdapter",
                      products: [
                        .library(
                            name: "LRAtsMediationAdapter",
                            targets: ["LRAtsMediationAdapterWrapper"]),
                      ],
                      dependencies: [
                        .package(
                            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
                            "10.0.0" ..< "11.0.0"
                        )
                      ],
                      targets: [
                        .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.2.1/LRAtsSDK.zip", checksum: "8ee30f766c227de80329b399ef585d5394a4578e02e784c3f53870f3ceed643e"),
                        .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.2.1/LRAtsSDKMediationAdapter.zip", checksum: "027739480539d67218939f4f7407022d9c907bc31a7f28a315a3c138bf658fa0"),
                        .target(name: "LRAtsMediationAdapterWrapper",
                                dependencies: [
                                    "LRAtsSDK",
                                    "LRAtsSDKMediationAdapter",
                                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                ]),
                      ]
)
