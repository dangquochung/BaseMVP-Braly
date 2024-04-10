import Foundation
import Common

class SettingsPresenter: ViewToPresenterSettingsProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewSettingsProtocol?
    private var router: PresenterToRouterSettingsProtocol?

    init(view: PresenterToViewSettingsProtocol) {
        self.view = view
    }
    
    // MARK: - Init
    func setRouter(router: PresenterToRouterSettingsProtocol) {
        self.router = router
    }
}
