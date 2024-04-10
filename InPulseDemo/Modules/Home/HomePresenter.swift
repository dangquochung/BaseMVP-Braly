import Foundation
import Common

class HomePresenter: ViewToPresenterHomeProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewHomeProtocol?
    private var router: PresenterToRouterHomeProtocol?

    init(view: PresenterToViewHomeProtocol) {
        self.view = view
    }
    
    // MARK: - Init
    func setRouter(router: PresenterToRouterHomeProtocol) {
        self.router = router
    }
}
