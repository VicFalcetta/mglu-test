import Foundation

protocol GitHubAppRepositoryType {
    func requestRepoList(page: Int, completion: @escaping (Result<RepoListData, GitHubAPIError>) -> Void)
    func requestPullList(owner: String, repoName: String, completion: @escaping (Result<[PullRequestListData], GitHubAPIError>) -> Void)
}
