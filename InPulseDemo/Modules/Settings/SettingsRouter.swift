import Foundation
import Swinject

final class SettingsRouter: PresenterToRouterSettingsProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        let viewController = Container.shared.resolve(SettingsVC.self)!
        return viewController
    }
}