import Foundation

protocol GitHubAppRepositoryType {
    func requestRepoList(page: Int, completion: @escaping (Result<RepoListData, GitHubAPIError>) -> Void)
}
