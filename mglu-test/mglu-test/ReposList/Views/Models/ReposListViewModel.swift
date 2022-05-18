import Foundation
import UIKit

struct ReposListViewModel: Equatable {
    let repos: [SingleRepoViewModel]
}

struct SingleRepoViewModel: Equatable {
    let repoName: String
    let repoDescription: String
    let repoForksNumber: Int
    let repoStarsNumber: Int
    let authorName: String
    let authorImage: UIImage?
}
