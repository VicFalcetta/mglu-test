import Foundation

@testable import mglu_test

extension RepoListData {
    static func stub() -> RepoListData {
        let singleRepoData = stubSingleRepoData()
        let repoList = [
            singleRepoData,
            singleRepoData,
            singleRepoData
        ]
        
        return RepoListData(items: repoList)
    }
    
    private static func stubOwnerData() -> OwnerData {
        return OwnerData(login: "Autorus Nomus",
                         avatar: "https://someimage.com.br")
    }
    
    private static func stubSingleRepoData() -> SingleRepoData {
        let ownerData = stubOwnerData()
        return SingleRepoData(name: "Repo Name",
                              description: "Repo description modus lorem ipsum",
                              owner: ownerData,
                              stargazersCount: 4,
                              forksCount: 32)
    }
}
