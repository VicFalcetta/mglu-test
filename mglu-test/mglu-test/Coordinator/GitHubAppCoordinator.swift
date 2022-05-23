import Foundation
import UIKit

enum GitHubAppFlow {
    case home
}

final class GitHubAppCoordinator {
    weak var currentViewController: UIViewController?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(flow: GitHubAppFlow) {
        switch flow {
        case .home:
            setupRepoList()
        }
    }
    
    private func setupRepoList() {
        let presenter = RepoListPresenter()
        let viewController = RepoListViewController(presenter: presenter)
        viewController.delegate = self
        presenter.viewController = viewController
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension GitHubAppCoordinator: RepoListControllerDelegate {
    func showPullRequestList(repoOwner: String, repoName: String) {
        let presenter = PullRequestListPresenter(repoOwner: repoOwner,
                                                 repoName: repoName)
        let viewController = PullRequestListController(presenter: presenter)
        viewController.delegate = self
        presenter.controller = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension GitHubAppCoordinator: PullRequestListControllerDelegate {
    func showPullRequestWebView(url: String) {
        let contentView = PullRequestWebView()
        let controller = PullRequestWebViewController(contentView: contentView,
                                                      url: url)
        navigationController.present(controller, animated: true)
    }
}
