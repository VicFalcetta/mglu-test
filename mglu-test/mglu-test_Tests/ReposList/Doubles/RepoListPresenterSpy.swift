import Foundation

@testable import mglu_test

final class RepoListPresenterSpy: RepoListPresenterType {
    var paginationRequested: Bool = false
    private(set) var sentIsPaginating: Bool?
    private(set) var requestRepoListCount = 0
    func requestReposList(isPaginating: Bool) {
        sentIsPaginating = isPaginating
        requestRepoListCount += 1
    }
    
    private(set) var sentIndex: Int?
    private(set) var getSelectedRepoCount = 0
    func getSelectedRepo(index: Int) -> SingleRepoViewModel {
        sentIndex = index
        getSelectedRepoCount += 1
        return SingleRepoViewModel(repoName: "Repo Name",
                                   repoDescription: "Repo description modus lorem ipsum",
                                   repoForksNumber: 32,
                                   repoStarsNumber: 4,
                                   authorName: "Autorus Nomus",
                                   authorImage: nil)
    }
}
