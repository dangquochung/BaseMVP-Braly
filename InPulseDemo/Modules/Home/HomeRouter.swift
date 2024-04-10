import Foundation
import Swinject

final class HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        let viewController = Container.shared.resolve(HomeVC.self)!
        return viewController
    }
}