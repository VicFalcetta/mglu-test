import Foundation

@testable import mglu_test

final class GitHubAppRepositorySpy: GitHubAppRepositoryType {
    var shouldFailRequest = false
    var repoListResponse: RepoListData?
    
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
}
