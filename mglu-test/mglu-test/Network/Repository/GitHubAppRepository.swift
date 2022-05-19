import Alamofire

final class GitHubAppRepository: GitHubAppRepositoryType {
    func requestRepoList(page: Int, completion: @escaping (Result<RepoListData, GitHubAPIError>) -> Void) {
        request(GitHubAppService.repoList(page: page),
                onComplete: completion)
    }

    private func request<T: Decodable>(_ spec: Request, onComplete: @escaping (Swift.Result<T, GitHubAPIError>) -> (Void)) {
        Session.default.request(
            type(of: self).url(path: spec.path),
            method: spec.method,
            parameters: spec.parameters,
            encoding: spec.encoding,
            headers: spec.headers
        )
        .validate(statusCode: 200..<600)
        .response { response in
            print("Request: \(response.request)")
            if let data = response.data,
               let json = String(data: data, encoding: .utf8) {
                print("Json: \n \(json)")
            }
        }
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case let .success(decoded):
                onComplete(.success(decoded))
            case let .failure(error):
                onComplete(.failure(GitHubAPIError.requestFailed(error)))
            }
        }
    }

    private static func url(path: String) -> URLConvertible {
        return "https://api.github.com\(path)"
    }
}
