import Foundation
import UIKit

protocol RepoListPresenterType {
    var paginationRequested: Bool { get }
    func requestReposList(isPaginating: Bool)
}

protocol RepoListControllerType: AnyObject {
    func show(viewModel: ReposListViewModel)
    func showScreenLoading(isLoading: Bool)
    func showPaginationLoading(isPaginating: Bool)
    func showError(hasError: Bool)
}

protocol RepoListControllerDelegate: AnyObject {
    // TODO: - Add methods that will be responsible to pass data to next view
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
