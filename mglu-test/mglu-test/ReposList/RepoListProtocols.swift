import Foundation
import UIKit

protocol RepoListPresenterType {
    func requestReposList(isPaginating: Bool)
}

protocol RepoListControllerType: AnyObject {
    func show(viewModel: ReposListViewModel)
    func showScreenLoading(isLoading: Bool)
}

protocol RepoListControllerDelegate: AnyObject {
    // TODO: - Add methods that will be responsible to pass data to next view
}

protocol ReposListViewType where Self: UIView {
    var reposTableDelegate: UITableViewDelegate?  { get set }
    func showLoading(isLoading: Bool)
    func show(viewModel: ReposListViewModel)
}
