import Foundation
import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {

        container.register(PresenterToRouterHomeProtocol.self) { (r) in
            let router = HomeRouter()
            return router
        }

        container.register(ViewToPresenterHomeProtocol.self) { (r, view: HomeVC) in
            let presenter = HomePresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterHomeProtocol.self)!)
            return presenter
        }

        container.register(HomeVC.self) { (r) in
            let vc = HomeVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterHomeProtocol.self, argument: vc)!)
            return vc
        }
    }
}
