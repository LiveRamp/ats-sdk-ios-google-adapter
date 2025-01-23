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
                          .binaryTarget(name: "LRAtsSDK", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.9.0/LRAtsSDK.zip", checksum: "2f9b3a1e725e97cb83587f2811763cece8fbac02321b6105806bd779740f164d"),
                          .binaryTarget(name: "LRAtsSDKMediationAdapter", url: "https://ats-sdk-ios-prod.launch.liveramp.com/2.9.0/LRAtsSDKMediationAdapter.zip", checksum: "47ff7017aa34b679b6b55ed0a66d2a8295c986a5a658d7361697283775bf12b1"),
                          .target(name: "LRAtsMediationAdapterWrapper",
                                  dependencies: [
                                      "LRAtsSDK",
                                      "LRAtsSDKMediationAdapter",
                                      .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                                  ]),
                      ]
)
