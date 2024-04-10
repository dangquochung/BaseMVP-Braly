import Foundation
import Swinject

class SplashAssembly: Assembly {
    func assemble(container: Container) {

        container.register(PresenterToRouterSplashProtocol.self) { (r) in
            let router = SplashRouter()
            return router
        }

        container.register(ViewToPresenterSplashProtocol.self) { (r, view: SplashVC) in
            let presenter = SplashPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterSplashProtocol.self)!)
            return presenter
        }

        container.register(SplashVC.self) { (r) in
            let vc = SplashVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterSplashProtocol.self, argument: vc)!)
            return vc
        }
    }
}
