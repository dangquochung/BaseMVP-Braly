//
//  AppAssembly.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Swinject

fileprivate let container: Container = {
    let container = Container()
    let assembler = Assembler(container: container)
    assembler.apply(assemblies: [
        ServiceAssembly(),
        SplashAssembly(),
        InAppPurchaseAssembly(),
        OnboardingAssembly(),
        SettingsAssembly()
    ])
    return container
}()

extension Container {
    static var shared: Resolver {
        return container.synchronize()
    }
}
