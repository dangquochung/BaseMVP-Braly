import Foundation

// MARK: - View Output (Presenter -> View)

protocol PresenterToViewHomeProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterHomeProtocol)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: AnyObject {
    func setRouter(router: PresenterToRouterHomeProtocol)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {

}
