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
                              targets: ["LRAtsMediationAdapterWrapper"])
                      ],
                      dependencies: [
                          .package(
                              url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
                              "10.0.0" ..< "13.0.0"
                          )
                      ],
                      targets: [
                          .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.2.0/LRAtsSDK.zip", checksum: "0485563866adb9809cea5f070e177f87b151ba3ed5232510e27b59c272f0213a"),
                          .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.2.0/LRAtsSDKMediationAdapter.zip", checksum: "c563bb431134d3e2f95d81d92300138a4cd86886c3e0184a862dc7775928e132"),
                          .target(name: "LRAtsMediationAdapterWrapper",
                                  dependencies: [
                                      "LRAtsSDK",
                                      "LRAtsSDKMediationAdapter",
                                      .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                  ])
                      ]
)
