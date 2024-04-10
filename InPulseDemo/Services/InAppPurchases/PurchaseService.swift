//
//  PurchaseService.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation
import Qonversion
import BralyLogger

struct PurchaseService {
    
//    func fetchProducts() async -> [Qonversion.Product] {
//        do {
//            let offerings = try await Qonversion.shared().offerings()
//            Logger.d(messages: "fetch products offerings: \(String(describing: offerings))")
//            if let products = offerings.main?.products {
//                return products
//            } else {
//                return []
//            }
//        } catch let error {
//            Logger.e(messages: "fetch products fail with error: \(error)")
//            return []
//        }
//    }
//    
//    func purchase(product: PurchaseProduct) async -> PurchaseResult {
//        do {
//            let (entitlements, isCancelled) = try await Qonversion.shared().purchase(product.qonversionID)
//            Logger.d(messages: "purchase product entitlements: \(entitlements)")
//            guard !isCancelled else {
//                Logger.d(messages: "purchase product cancel")
//                return .normalAccount
//            }
//            return .premiumAccount
//        } catch let error {
//            Logger.e(messages: "purchase product fail with error: \(error)")
//            return .normalAccount
//        }
//    }
//    
//    func restore() async -> RestoreResult {
//        do {
//            let entitlements = try await Qonversion.shared().restore()
//            let restored = entitlements.values.filter { $0.isActive }
//            return restored.isEmpty ? .transactionsEmpty : .success
//        } catch let error {
//            Logger.e(messages: "restore fail with error: \(error)")
//            return .transactionsEmpty
//        }
//    }
//    
//    func isPremium() async -> Bool {
//        do {
//            let entitlements = try await Qonversion.shared().checkEntitlements()
//            Logger.d(messages: "check current premium status: \(entitlements)")
//            let result = entitlements.values.contains(where: {$0.isActive == true})
//            Logger.d(messages: "check current premium status: \(result)")
//            return result
//        } catch let error {
//            Logger.e(messages: "check premium fail with error: \(error)")
//            return false
//        }
//    }
}
