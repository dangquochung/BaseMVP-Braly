import Foundation

// MARK: - View Output (Presenter -> View)

protocol PresenterToViewSplashProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterSplashProtocol)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterSplashProtocol: AnyObject {
    func setRouter(router: PresenterToRouterSplashProtocol)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterSplashProtocol: AnyObject {

}
