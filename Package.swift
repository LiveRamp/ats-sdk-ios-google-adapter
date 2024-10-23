// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "LRAtsMediationAdapter",
                      platforms: [
                          .iOS(.v12)
                      ],
                      products: [
                          .library(
                              name: "LRAtsMediationAdapter",
                              targets: ["LRAtsMediationAdapterWrapper"]),
                      ],
                      dependencies: [
                          .package(
                              url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
                              "10.0.0" ..< "12.0.0"
                          )
                      ],
                      targets: [
                          .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.7.0/LRAtsSDK.zip", checksum: "33789b614dce73ed22ccf6250177c044db3c5a3af549114d242cbb11f9d492d4"),
                          .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.7.0/LRAtsSDKMediationAdapter.zip", checksum: "6517ded4e72fbd33250a32123e3151cbd8d551d6bae7f99799d2f8227c7134b2"),
                          .target(name: "LRAtsMediationAdapterWrapper",
                                  dependencies: [
                                      "LRAtsSDK",
                                      "LRAtsSDKMediationAdapter",
                                      .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                  ]),
                      ]
)
