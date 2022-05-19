import Foundation

@testable import mglu_test

final class RepoListPresenterSpy: RepoListPresenterType {
    private(set) var sentIsPaginating: Bool?
    private(set) var requestRepoListCount = 0
    func requestReposList(isPaginating: Bool) {
        sentIsPaginating = isPaginating
        requestRepoListCount += 1
    }
}
