import Foundation
import Swinject

final class InAppPurchaseRouter: PresenterToRouterInAppPurchaseProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        let viewController = Container.shared.resolve(InAppPurchaseVC.self)!
        return viewController
    }
}