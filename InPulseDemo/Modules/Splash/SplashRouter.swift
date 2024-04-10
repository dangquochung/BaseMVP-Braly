import Foundation
import Swinject

final class SplashRouter: PresenterToRouterSplashProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        let viewController = Container.shared.resolve(SplashVC.self)!
        return viewController
    }
}