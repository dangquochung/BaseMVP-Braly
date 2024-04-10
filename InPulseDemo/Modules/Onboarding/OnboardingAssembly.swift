import Foundation
import Swinject

class OnboardingAssembly: Assembly {
    func assemble(container: Container) {

        container.register(PresenterToRouterOnboardingProtocol.self) { (r) in
            let router = OnboardingRouter()
            return router
        }

        container.register(ViewToPresenterOnboardingProtocol.self) { (r, view: OnboardingVC) in
            let presenter = OnboardingPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterOnboardingProtocol.self)!)
            return presenter
        }

        container.register(OnboardingVC.self) { (r) in
            let vc = OnboardingVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterOnboardingProtocol.self, argument: vc)!)
            return vc
        }
    }
}
