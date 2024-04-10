//
//  ServiceAssembly.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserDefaultsServiceProtocol.self) { r in
            UserDefaultsService()
        }

        container.register(RealmService.self) { r in
            RealmService()
        }.inObjectScope(.container)
        
        container.register(PurchaseService.self) { r in
            PurchaseService()
        }.inObjectScope(.container)
    }
}
