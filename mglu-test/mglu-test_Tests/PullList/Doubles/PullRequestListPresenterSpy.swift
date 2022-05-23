import Foundation

@testable import mglu_test

final class PullRequestPresenterSpy: PullRequestListPresenterType {
    private(set) var sentIndex: Int?
    private(set) var getPullRequestUrlCount = 0
    func getPullRequestUrl(index: Int) -> String {
        sentIndex = index
        getPullRequestUrlCount += 1
        return "https://someurl.com"
    }
    
    private(set) var setupPullListDataCount = 0
    func setupPullListData() {
        setupPullListDataCount += 1
    }
}
