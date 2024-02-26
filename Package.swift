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
                        .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.4.0/LRAtsSDK.zip", checksum: "32463267f81402445ed89e96ec4cd2c6db843cf8c1a611646cfb9c3e8c16fa5d"),
                        .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.4.0/LRAtsSDKMediationAdapter.zip", checksum: "30fc419eda0a8097c5560733eb17ee9b498647a97db464c295159ef8e105aec1"),
                        .target(name: "LRAtsMediationAdapterWrapper",
                                dependencies: [
                                    "LRAtsSDK",
                                    "LRAtsSDKMediationAdapter",
                                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                ]),
                      ]
)
