# Google Mediation Adapter for LRATsSDK

LRAtsMediationAdapter facilitates the exchange of data between the AdMob and LRAts SDKs. The adapter enables AdMob SDK to collect signals from LRAts SDK.

# Installation
To install LRAtsSDK in a Swift application

1. In Xcode, go to File > Add Packages
2. In Search or Enter Package URL, enter https://github.com/LiveRamp/ats-sdk-ios-google-adapter
3. Click Add Package

# Usage
To enable signal collection from LRAts SDK there are a few required steps before initializing AdMob SDK.
The setup is applicable for version 2.9.0 and below. No extra setup needed from version 3.0.0 onwards.

```swift
import LRAtsSDKMediationAdapter

LRAtsMediationAdapter.setIdentifier(LREmailIdentifier(email: "<#email#>"))
LRAtsMediationAdapter.configure(atsConfiguration: LRAtsConfiguration(appId: "<#your app id#>"))
// optional
// LRAtsMediationAdapter.hasConsentForNoLegislation = true
```

For more information see our [documentation](https://developers.liveramp.com/authenticatedtraffic-api/docs/ios-methods-for-lratsmediationadapter).

# Consent Requirements
The SDK will automatically perform a geolocation check to ensure consent is properly set for GDPR and CCPA. Learn what this means for your application below:

To successfully initialize and use the SDK, user consent needs to be present per IAB standards (ie: in NSUserDefaults). The SDK will fail to initialize if there is no consent given for TCF purposes 1 to 10 and if LiveRamp is not listed as a vendor (ID 97). If you are running the SDK outside of the GDPR and CCPA legislations, you can set the default consent state with the following method: LRAts.shared.hasConsentForNoLegislation. Dynamic TCF and CCPA consent monitoring and handling is applied. This ensures if consent is revoked, SDK will reset (clear cached data) and all SDK-related APIs will stop working. The SDK will automatically re-initialise and APIs will work again if consent is given during lifecycle of the application.
