import Foundation
import Swinject

class SettingsAssembly: Assembly {
    func assemble(container: Container) {

        container.register(PresenterToRouterSettingsProtocol.self) { (r) in
            let router = SettingsRouter()
            return router
        }

        container.register(ViewToPresenterSettingsProtocol.self) { (r, view: SettingsVC) in
            let presenter = SettingsPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterSettingsProtocol.self)!)
            return presenter
        }

        container.register(SettingsVC.self) { (r) in
            let vc = SettingsVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterSettingsProtocol.self, argument: vc)!)
            return vc
        }
    }
}
