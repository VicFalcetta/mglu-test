import Foundation

protocol PullRequestListControllerType: AnyObject {
    func showError(hasError: Bool)
    func showLoading(isLoading: Bool)
    func show(viewModel: [PullRequestViewModel])
}

protocol PullRequestListControllerDelegate: AnyObject {
    func showPullRequestWebView(url: String)
}

protocol PullRequestListPresenterType {
    func setupPullListData()
    func getPullRequestUrl(index: Int) -> String
}
