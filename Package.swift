// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationUnityAds",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationUnityAds", targets: ["Yodo1MasMediationUnityAdsTarget"]),
        .library(name: "Yodo1MasMediationUnityAds-AppLovinMediationUnityAdsAdapter", targets: ["Yodo1MasMediationUnityAds-AppLovinMediationUnityAdsAdapterTarget"]),
        .library(name: "Yodo1MasMediationUnityAds-UnityAdapter", targets: ["Yodo1MasMediationUnityAds-UnityAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git", exact: "4.21.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationUnityAds ====================
        .target(
            name: "Yodo1MasMediationUnityAdsTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationUnityAds"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
            ],
            path: "Sources/Yodo1MasMediationUnityAdsTarget",
            resources: [.copy("Yodo1MasUnityAds.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationUnityAds",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationUnityAds/Yodo1MasMediationUnityAds-5.0.0-beta.5.zip",
            checksum: "c5fb77d00878eae63dc2620b2a8e3c7084ae9ea620a4bbcb6557506da23ce500"
        ),
        // ==================== Yodo1MasMediationUnityAds-AppLovinMediationUnityAdsAdapter ====================
        .target(
            name: "Yodo1MasMediationUnityAds-AppLovinMediationUnityAdsAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationUnityAdsTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationUnityAdsAdapter"),
            ],
            path: "Sources/Yodo1MasMediationUnityAds-AppLovinMediationUnityAdsAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationUnityAdsAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationUnityAds/AppLovinMediationUnityAdsAdapter-5.0.0-beta.5.zip",
            checksum: "88809cb40363568c45ab72027880ae34733b088bbc6b3098db7c6d68cc9d0095"
        ),
        // ==================== Yodo1MasMediationUnityAds-UnityAdapter ====================
        .target(
            name: "Yodo1MasMediationUnityAds-UnityAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationUnityAdsTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "UnityAdapter"),
            ],
            path: "Sources/Yodo1MasMediationUnityAds-UnityAdapterTarget"
        ),
        .binaryTarget(
            name: "UnityAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationUnityAds/UnityAdapter-5.0.0-beta.5.zip",
            checksum: "3c8a93af5ecf4890b133fad63e26283f2ac87b604769f5d137c130d6a4c5a55f"
        ),
    ]
)
