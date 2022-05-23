import Foundation
import UIKit

struct PullRequestViewModel: Equatable {
    let pullRequestName: String
    let pullRequestDate: String
    let pullRequestDesc: String
    let authorName: String
    let authorImage: UIImage?
}
