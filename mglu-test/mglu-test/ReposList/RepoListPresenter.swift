import Foundation
import UIKit

final class RepoListPresenter {
    weak var viewController: RepoListControllerType?
    private let repository: GitHubAppRepositoryType
    private(set) var paginationRequested: Bool = false
    private var currentPage: Int = 1
    private var currentRepoList: [SingleRepoViewModel] = []
    
    init(repository: GitHubAppRepositoryType = GitHubAppRepository()) {
        self.repository = repository
    }
    
    private func setupViewModel(repoList: RepoListData,
                                isPaginating: Bool = false) {
        let repos: [SingleRepoViewModel] = repoList.items.map {
            let username = $0.owner.login
            let singleRepo = SingleRepoViewModel(repoName: $0.name,
                                                 repoDescription: $0.description ?? "",
                                                 repoForksNumber: $0.forksCount,
                                                 repoStarsNumber: $0.stargazersCount,
                                                 authorName: username,
                                                 authorImage: nil)
            return singleRepo
        }
        
        currentRepoList.append(contentsOf: repos)
        
        let repoListViewModel = ReposListViewModel(repos: currentRepoList)
        viewController?.show(viewModel: repoListViewModel)
    }
    
    private func setupLoading(isPaginating: Bool = false,
                              isLoading: Bool = false) {
        if isPaginating {
            viewController?.showPaginationLoading(isPaginating: isPaginating)
        } else {
            viewController?.showScreenLoading(isLoading: isLoading)
        }
    }
}

extension RepoListPresenter: RepoListPresenterType {
    func requestReposList(isPaginating: Bool) {
        paginationRequested = isPaginating
        currentPage = isPaginating ? currentPage + 1 : currentPage
        setupLoading(isPaginating: isPaginating, isLoading: true)
        repository.requestRepoList(page: currentPage) { [weak self] result in
            self?.paginationRequested = false
            self?.setupLoading()
            switch result {
            case .success(let repoList):
                self?.setupViewModel(repoList: repoList)
            case .failure:
                self?.viewController?.showError(hasError: true)
            }
        }
    }
}
