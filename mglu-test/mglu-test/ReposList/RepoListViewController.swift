import Foundation
import UIKit

final class RepoListViewController: UIViewController {
    weak var delegate: RepoListControllerDelegate?
    private let presenter: RepoListPresenterType
    private let contentView: ReposListViewType
    
    init(presenter: RepoListPresenterType,
         contentView: ReposListViewType = ReposListView()) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindLayoutEvents()
        presenter.requestReposList(isPaginating: false)
        contentView.reposTableDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func bindLayoutEvents() {
        contentView.didPressTryAgain = { [weak self] in
            self?.presenter.requestReposList(isPaginating: false)
            self?.showError(hasError: false)
        }
    }
}

extension RepoListViewController: RepoListControllerType {
    func showPaginationLoading(isPaginating: Bool) {
        contentView.showPaginationLoading(isPaginating: isPaginating)
    }
    
    func show(viewModel: ReposListViewModel) {
        contentView.show(viewModel: viewModel)
    }
    
    func showScreenLoading(isLoading: Bool) {
        contentView.showLoading(isLoading: isLoading)
    }
    
    func showError(hasError: Bool) {
        contentView.showError(hasError: hasError)
    }
}

extension RepoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRepo = presenter.getSelectedRepo(index: indexPath.row)
        delegate?.showPullRequestList(repoOwner: selectedRepo.authorName,
                                      repoName: selectedRepo.repoName)
    }
}

extension RepoListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if presenter.paginationRequested {
            return
        }

        let position = scrollView.contentOffset.y
        let edgePositionForFetch = (contentView.reposTableViewContentSize - scrollView.frame.size.height) - 50
        if position > edgePositionForFetch {
            presenter.requestReposList(isPaginating: true)
        }
    }
}
