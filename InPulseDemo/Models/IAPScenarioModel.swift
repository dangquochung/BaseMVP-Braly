//
//  IAPScenarioModel.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation

struct IAPScenarioModel: Codable {
    let iapPosition: [String: IAPPosition]?
    
    enum CodingKeys: String, CodingKey {
        case iapPosition = "positions"
    }
}

struct IAPPosition: Codable {
    let enable: Bool?
    let paywallUI: PaywallUIEnum?
    let paywallOutline: PaywallOutline?
    let variant: String?
    
    enum CodingKeys: String, CodingKey {
        case enable = "enable"
        case paywallUI = "paywall_ui"
        case paywallOutline = "paywall_outline"
        case variant = "variant"
    }
}

struct PaywallOutline: Codable {
    let title: String?
    let subtitle: String?
    let description: [TextComponent]?
    let benefits: [TextComponent]?
    let packs: [IAPPack]?
    let ctaText: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case subtitle = "subtitle"
        case description = "description"
        case benefits = "benefits"
        case packs = "packs"
        case ctaText = "cta_text"
    }
}

struct IAPPack: Codable {
    let product: String?
    let unitForPack: String?
    let saleOff: Double?
    let bestPrice: Bool?
    let bestPriceText: String?
    let textDownProduct: [TextComponent]?
    
    enum CodingKeys: String, CodingKey {
        case product = "product"
        case unitForPack = "unit_for_pack"
        case saleOff = "sale_off"
        case bestPrice = "best_price"
        case bestPriceText = "best_price_text"
        case textDownProduct = "text_down_product"
    }
}

struct TextComponent: Codable {
    let text: String?
    let style: String?
}
