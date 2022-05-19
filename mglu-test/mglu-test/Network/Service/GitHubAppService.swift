import Foundation
import Alamofire

enum GitHubAppService {
    case repoList(page: Int)
    case pullList(owner: String, repo: String)
}

extension GitHubAppService: Request {
    var path: String {
        switch self {
        case .repoList:
            return "/search/repositories"
        case .pullList(let owner, let repo):
            return "/repos/\(owner)/\(repo)/pulls"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        URLEncoding(destination: .queryString)
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .repoList(let page):
            return [
                "q": "language:Swift",
                "sort": "stars",
                "page": "\(page)"
            ]
        default:
            return nil
        }
    }
}
