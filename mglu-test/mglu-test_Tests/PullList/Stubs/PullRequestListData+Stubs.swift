import Foundation

@testable import mglu_test

extension PullRequestListData {
    static func stub() -> [PullRequestListData] {
        let pullRequest = stubPullRequestData()
        return [pullRequest, pullRequest, pullRequest]
    }
    
    private static func stubPullRequestData() -> PullRequestListData {
        return PullRequestListData(title: "Pull Request Name",
                                   body: "Pull Request Description",
                                   pullDate: "2022-05-22T12:57:14Z",
                                   pullUrl: "https://somepullrequest.com.br",
                                   user: stubOwnerData())
    }
    
    private static func stubOwnerData() -> OwnerData {
        return OwnerData(login: "Pull Request Author",
                         avatar: "https://someimage.com.br")
    }
}
