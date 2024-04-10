import Foundation

// MARK: - View Output (Presenter -> View)

protocol PresenterToViewOnboardingProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterOnboardingProtocol)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterOnboardingProtocol: AnyObject {
    func setRouter(router: PresenterToRouterOnboardingProtocol)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterOnboardingProtocol: AnyObject {

}
