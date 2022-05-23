import Foundation
import UIKit

protocol RepoListPresenterType {
    var paginationRequested: Bool { get }
    func requestReposList(isPaginating: Bool)
    func getSelectedRepo(index: Int) -> SingleRepoViewModel
}

protocol RepoListControllerType: AnyObject {
    func show(viewModel: ReposListViewModel)
    func showScreenLoading(isLoading: Bool)
    func showPaginationLoading(isPaginating: Bool)
    func showError(hasError: Bool)
}

protocol RepoListControllerDelegate: AnyObject {
    func showPullRequestList(repoOwner: String, repoName: String)
}

protocol ReposListViewType where Self: UIView {
    var reposTableDelegate: UITableViewDelegate?  { get set }
    var reposTableViewContentSize: CGFloat { get }
    var didPressTryAgain: (() -> Void)? { get set }
    func showLoading(isLoading: Bool)
    func show(viewModel: ReposListViewModel)
    func showPaginationLoading(isPaginating: Bool)
    func showError(hasError: Bool)
}
