import Foundation

struct RepoListData: Decodable, Equatable {
    let items: [SingleRepoData]
}

struct SingleRepoData: Decodable, Equatable {
    let name: String
    let description: String?
    let owner: OwnerData
    let stargazersCount: Int
    let forksCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case owner
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}

struct OwnerData: Decodable, Equatable {
    let login: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatar = "avatar_url"
    }
}
