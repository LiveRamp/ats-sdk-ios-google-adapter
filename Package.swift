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
                              "10.0.0" ..< "13.0.0"
                          )
                      ],
                      targets: [
                          .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.1.0/LRAtsSDK.zip", checksum: "6e921edf0ad542277f2ba34908cd3a85e697c33fdb9ef95eaee4b34b390d95bc"),
                          .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.1.0/LRAtsSDKMediationAdapter.zip", checksum: "95e7fb14aba1d66fa8b6074b5b9e4d6d007191ec655dbe20f7393cc9d2310572"),
                          .target(name: "LRAtsMediationAdapterWrapper",
                                  dependencies: [
                                      "LRAtsSDK",
                                      "LRAtsSDKMediationAdapter",
                                      .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                  ]),
                      ]
)
