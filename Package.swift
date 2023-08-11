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
                        .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.2.0/LRAtsSDK.zip", checksum: "e44f08c6fa747d62ce0f14c6e3d517c803d88a9d99a5453ccc2d7f9673196014"),
                        .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.2.0/LRAtsSDKMediationAdapter.zip", checksum: "349b7952a06c5a05098b2b394e287c65dd1d0071b26c85d7ac65a5436a0bb1ea"),
                        .target(name: "LRAtsMediationAdapterWrapper",
                                dependencies: [
                                    "LRAtsSDK",
                                    "LRAtsSDKMediationAdapter",
                                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                ]),
                      ]
)
