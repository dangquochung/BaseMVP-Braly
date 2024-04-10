//
//  IAPPositionEnum.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation

enum IAPPositionEnum: String {
    case ftus = "ftus"
    case afterSplash = "after_splash"
    case iconVIP = "icon_vip"
    case bannerVIP = "banner_vip"
}

enum PaywallUIEnum: String, Codable {
    case openAppOne = "iap_openapp1"
    case saleOffOne = "iap_saleoff1"
    case saleOffTwo = "iap_saleoff2"
}
