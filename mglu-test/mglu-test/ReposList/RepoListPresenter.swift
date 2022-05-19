import Foundation
import UIKit

final class RepoListPresenter {
    weak var viewController: RepoListControllerType?
    private let repository: GitHubAppRepositoryType
    private var currentPage: Int = 1
    private var currentViewModel: ReposListViewModel?
    
    init(repository: GitHubAppRepositoryType = GitHubAppRepository()) {
        self.repository = repository
    }
    
    private func setupViewModel(repoList: RepoListData) {
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
        
        let repoListViewModel = ReposListViewModel(repos: repos)
        viewController?.showScreenLoading(isLoading: false)
        viewController?.show(viewModel: repoListViewModel)
    }
}

extension RepoListPresenter: RepoListPresenterType {
    func requestReposList(isPaginating: Bool) {
        currentPage = isPaginating ? currentPage + 1 : currentPage
        viewController?.showScreenLoading(isLoading: true)
        repository.requestRepoList(page: currentPage) { [weak self] result in
            switch result {
            case .success(let repoList):
                self?.setupViewModel(repoList: repoList)
            case .failure(let error):
                print("There was an error: \(error)")
            }
        }
    }
}
