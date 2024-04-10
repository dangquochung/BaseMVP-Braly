import Foundation

// MARK: - View Output (Presenter -> View)

protocol PresenterToViewSettingsProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterSettingsProtocol)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterSettingsProtocol: AnyObject {
    func setRouter(router: PresenterToRouterSettingsProtocol)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterSettingsProtocol: AnyObject {

}
