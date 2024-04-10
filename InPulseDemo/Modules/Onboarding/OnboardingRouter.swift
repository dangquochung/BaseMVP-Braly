import Foundation
import Swinject

final class OnboardingRouter: PresenterToRouterOnboardingProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        let viewController = Container.shared.resolve(OnboardingVC.self)!
        return viewController
    }
}