//
//  GlobalSubject.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Combine

struct GlobalSubject {
    // MARK: - Properties
    static let shared = GlobalSubject()

    // MARK: - Functions
    private init() {}
    
    // MARK: - Triggers
    let onChangeCMPSetting = CurrentValueSubject<Bool, Never>(false)
    let premiumDidChanged = CurrentValueSubject<Bool, Never>(false)
    let openPurchaseScreen = CurrentValueSubject<String, Never>("")
}
