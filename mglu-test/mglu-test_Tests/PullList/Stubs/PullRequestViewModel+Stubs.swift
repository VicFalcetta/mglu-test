import Foundation

@testable import mglu_test

extension PullRequestViewModel {
    static func stub() -> [PullRequestViewModel] {
        let pullRequest = PullRequestViewModel(pullRequestName: "Pull Request Name",
                                               pullRequestDate: "22/05/22",
                                               pullRequestDesc: "Pull Request Description",
                                               authorName: "Pull Request Author",
                                               authorImage: nil)
        return [pullRequest, pullRequest, pullRequest]
    }
}
