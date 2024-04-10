//
//  Constants.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation

struct Constants {
    static let kPremiumSubscription = "KEY_PREMIUM_SUBSCRIPTION"
    static let kFirstDayUsing = "KEY_FIRST_DAY_USING"
    static let kIAPShowCount = "KEY_IAP_SHOW_COUNT"
}

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

struct ConstantsSettings {
    static let kAppID = ""
    static let kPrivacyURL = "https://bralyvn.com/privacy-policy.php"
    static let kTermOfUseURL = "https://bralyvn.com/term-and-condition.php"
    static let kShareAppURL = "https://apps.apple.com/app/id\(kAppID)"
    static let kSupportMail = "support.volumebooster@bralyvn.com"
    static let kAppStorePage = "https://itunes.apple.com/app/id\(kAppID)"
    static let kAppRateURL = "\(kAppStorePage)?action=write-review"
    static let kManageSubscriptionsURL = "https://apps.apple.com/account/subscriptions"
}

struct ConstantsCommon {
    static let kFirstTimeLaunchApp = "FIRST_TIME_LAUNCH_APP"
}

struct ConstantsKey {
    
    static let appFlyerKey = ""
    
#if DEV
    static let qonversionKey = ""
#else
    static let qonversionKey = ""
#endif
    
    static let appMetricaKey = "6a94c371--44fb-8b4c-013897c2e586"
}

struct SlackConstants {
    static let channelID = ""
    static let token = ""
}

struct ConfigConstants {
    static let keyAdsConfig = "ads_config_v1"
#if DEV
    static let keyIAPScenario = "scenario_iap_temp"
#else
    static let keyIAPScenario = "scenario_iap_v1"
#endif
}
