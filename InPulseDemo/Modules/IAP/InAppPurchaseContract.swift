import Foundation

// MARK: - View Output (Presenter -> View)

protocol PresenterToViewInAppPurchaseProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterInAppPurchaseProtocol)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterInAppPurchaseProtocol: AnyObject {
    func setRouter(router: PresenterToRouterInAppPurchaseProtocol)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterInAppPurchaseProtocol: AnyObject {

}
