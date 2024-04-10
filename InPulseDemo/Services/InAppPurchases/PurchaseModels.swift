//
//  PurchaseModels.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation
import StoreKit

enum PurchaseResult {
    case premiumAccount
    case normalAccount
}

enum RestoreResult {
    case success
    case transactionsEmpty
}

struct PurchaseProduct {
    let prettyPrice: String
    let qonversionID: String
    let skProduct: SKProduct?
    let isTrial: Bool
}
