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
                        .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.3.0/LRAtsSDK.zip", checksum: "1aaa30e3abc374cce46b364acbca52a23eb1f0da1d84d85d0606a5bf95323b47"),
                        .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.3.0/LRAtsSDKMediationAdapter.zip", checksum: "6d909ea5fc306980e47daa89e8fe8af8c45ae6ca731e8cdc261fd66319c626f4"),
                        .target(name: "LRAtsMediationAdapterWrapper",
                                dependencies: [
                                    "LRAtsSDK",
                                    "LRAtsSDKMediationAdapter",
                                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                ]),
                      ]
)
