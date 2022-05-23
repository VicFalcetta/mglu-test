import Foundation

struct PullRequestListData: Decodable, Equatable {
    let title: String
    let body: String
    let pullDate: String
    let pullUrl: String
    let user: OwnerData
    
    enum CodingKeys: String, CodingKey {
        case title
        case body
        case pullDate = "created_at"
        case pullUrl = "html_url"
        case user
    }
}
