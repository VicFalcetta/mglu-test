import Foundation

@testable import mglu_test

final class GitHubAppRepositorySpy: GitHubAppRepositoryType {
    var shouldFailRequest = false
    var repoListResponse: RepoListData?
    var pullListResponse: [PullRequestListData]?
    
    private(set) var sentPage: Int?
    private(set) var requestRepoListCount = 0
    func requestRepoList(page: Int, completion: @escaping (Result<RepoListData, GitHubAPIError>) -> Void) {
        requestRepoListCount += 1
        sentPage = page
        if shouldFailRequest {
            completion(.failure(.genericError))
        } else if let repoListResponse = repoListResponse {
            completion(.success(repoListResponse))
        }
    }
    
    private(set) var sentOwner: String?
    private(set) var sentRepoName: String?
    private(set) var requestPullListCount = 0
    func requestPullList(owner: String, repoName: String, completion: @escaping (Result<[PullRequestListData], GitHubAPIError>) -> Void) {
        sentOwner = owner
        sentRepoName = repoName
        requestPullListCount += 1
        if shouldFailRequest {
            completion(.failure(.genericError))
        } else if let pullListResponse = pullListResponse {
            completion(.success(pullListResponse))
        }
    }
}
