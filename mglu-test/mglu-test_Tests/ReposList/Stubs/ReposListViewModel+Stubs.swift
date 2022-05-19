import Foundation

@testable import mglu_test

extension ReposListViewModel {
    static func stub() -> ReposListViewModel {
        let singleRepoViewModel = SingleRepoViewModel(repoName: "Repo Name",
                                                      repoDescription: "Repo description modus lorem ipsum",
                                                      repoForksNumber: 32,
                                                      repoStarsNumber: 4,
                                                      authorName: "Autorus Nomus",
                                                      authorImage: nil)
        return ReposListViewModel(repos: [
            singleRepoViewModel,
            singleRepoViewModel,
            singleRepoViewModel
        ])
    }
}
