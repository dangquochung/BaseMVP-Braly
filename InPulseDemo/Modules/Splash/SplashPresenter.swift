import Foundation
import Common

class SplashPresenter: ViewToPresenterSplashProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewSplashProtocol?
    private var router: PresenterToRouterSplashProtocol?

    init(view: PresenterToViewSplashProtocol) {
        self.view = view
    }
    
    // MARK: - Init
    func setRouter(router: PresenterToRouterSplashProtocol) {
        self.router = router
    }
}
