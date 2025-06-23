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
                          .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.0.0/LRAtsSDK.zip", checksum: "a0365c0f397fb1edec82a007393b470e30510f9f3273f034cfcbe7c01ce46959"),
                          .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/3.0.0/LRAtsSDKMediationAdapter.zip", checksum: "08710d976b912e84287d8c0df5c978b0310e4cc9f87d4cef42cc07d140c0f322"),
                          .target(name: "LRAtsMediationAdapterWrapper",
                                  dependencies: [
                                      "LRAtsSDK",
                                      "LRAtsSDKMediationAdapter",
                                      .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                  ]),
                      ]
)
