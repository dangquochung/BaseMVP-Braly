import Foundation
import Common

class OnboardingPresenter: ViewToPresenterOnboardingProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewOnboardingProtocol?
    private var router: PresenterToRouterOnboardingProtocol?

    init(view: PresenterToViewOnboardingProtocol) {
        self.view = view
    }
    
    // MARK: - Init
    func setRouter(router: PresenterToRouterOnboardingProtocol) {
        self.router = router
    }
}
