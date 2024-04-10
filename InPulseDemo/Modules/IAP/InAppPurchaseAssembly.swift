import Foundation
import Swinject

class InAppPurchaseAssembly: Assembly {
    func assemble(container: Container) {

        container.register(PresenterToRouterInAppPurchaseProtocol.self) { (r) in
            let router = InAppPurchaseRouter()
            return router
        }

        container.register(ViewToPresenterInAppPurchaseProtocol.self) { (r, view: InAppPurchaseVC) in
            let presenter = InAppPurchasePresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterInAppPurchaseProtocol.self)!)
            return presenter
        }

        container.register(InAppPurchaseVC.self) { (r) in
            let vc = InAppPurchaseVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterInAppPurchaseProtocol.self, argument: vc)!)
            return vc
        }
    }
}
