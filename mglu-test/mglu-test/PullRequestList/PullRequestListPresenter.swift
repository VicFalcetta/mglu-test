import Foundation

final class PullRequestListPresenter: PullRequestListPresenterType {
    weak var controller: PullRequestListControllerType?
    private let repository: GitHubAppRepositoryType
    private let repoOwner: String
    private let repoName: String
    private var pullRequestList: [PullRequestListData] = []
    
    init(repository: GitHubAppRepositoryType = GitHubAppRepository(),
         repoOwner: String,
         repoName: String) {
        self.repository = repository
        self.repoName = repoName
        self.repoOwner = repoOwner
    }
    
    func setupPullListData() {
        controller?.showLoading(isLoading: true)
        repository.requestPullList(owner: repoOwner,
                                   repoName: repoName) { [weak self] result in
            self?.controller?.showLoading(isLoading: false)
            switch result {
            case .success(let pullData):
                self?.setupViewModel(pullData: pullData)
                self?.pullRequestList = pullData
            case .failure:
                self?.controller?.showError(hasError: true)
            }
        }
    }
    
    func getPullRequestUrl(index: Int) -> String {
        return pullRequestList[index].pullUrl
    }
    
    private func setupViewModel(pullData: [PullRequestListData]) {
        let pullRequests: [PullRequestViewModel] = pullData.map {
            let username = $0.user.login
            let singlePullRequest = PullRequestViewModel(pullRequestName: $0.title,
                                                         pullRequestDate: transformDateFromData(rawDate: $0.pullDate),
                                                         pullRequestDesc: $0.body,
                                                         authorName: username,
                                                         authorImage: nil)
            return singlePullRequest
        }
        
        controller?.show(viewModel: pullRequests)
    }
    
    private func transformDateFromData(rawDate: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let transformedDate = isoFormatter.date(from: rawDate)
        guard let transformedDate = transformedDate else {
            return "Data Indisponível"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        let formattedDate = dateFormatter.string(from: transformedDate)
        return formattedDate
    }
}
