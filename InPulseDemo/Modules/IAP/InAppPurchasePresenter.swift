import Foundation
import Common

class InAppPurchasePresenter: ViewToPresenterInAppPurchaseProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewInAppPurchaseProtocol?
    private var router: PresenterToRouterInAppPurchaseProtocol?

    init(view: PresenterToViewInAppPurchaseProtocol) {
        self.view = view
    }
    
    // MARK: - Init
    func setRouter(router: PresenterToRouterInAppPurchaseProtocol) {
        self.router = router
    }
}
