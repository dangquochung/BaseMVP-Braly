//
//  AppService.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Combine
import CoreFoundation
import AdsModule
import Swinject

class AppService {
    
    static let shared = AppService()

    private let userDefaultsService: UserDefaultsServiceProtocol

    private init() {
        self.userDefaultsService = Container.shared.resolve(UserDefaultsServiceProtocol.self)!
    }
        
    private var iapConfig: [String: IAPPosition]? = nil
    
    var iapScenario: [String: IAPPosition]? {
        get {
            return iapConfig
        }
        set {
            self.iapConfig = newValue
        }
    }
    
    private var isPremium: Bool = false
    
    var isPremiumSubscription: Bool {
        get {
            return isPremium
        }
        set {
            self.isPremium = newValue
            GlobalSubject.shared.premiumDidChanged.value = newValue
            if newValue {
                ConfigManager.shared.isEnable = false
            }
        }
    }
    
    func isFirstTimeUsing() -> Bool {
        return userDefaultsService.boolValue(key: ConstantsCommon.kFirstTimeLaunchApp)
    }
    
    func countIAPShow() {
        let lastCount = userDefaultsService.intValue(suiteName: "", key: Constants.kIAPShowCount) ?? 0
        userDefaultsService.setInterger(suiteName: "", value: lastCount+1, key: Constants.kIAPShowCount)
    }
    
}
