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
                        .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.1.0/LRAtsSDK.zip", checksum: "bd0f02b589a202e7e7aca690f19baa7edb087626d769eba160fa2a0da2f18f0b"),
                        .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.1.0/LRAtsSDKMediationAdapter.zip", checksum: "82cc4369cb9f9d220222cf890641a60463e34152a2f0aab1d5e733674fabf1b2"),
                        .target(name: "LRAtsMediationAdapterWrapper",
                                dependencies: [
                                    "LRAtsSDK",
                                    "LRAtsSDKMediationAdapter",
                                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                ]),
                      ]
)
