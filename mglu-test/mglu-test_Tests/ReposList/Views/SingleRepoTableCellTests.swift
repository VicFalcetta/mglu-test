import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class SingleRepoTableCellTests: QuickSpec {
    override func spec() {
        var sut: SingleRepoView!
        
        beforeEach {
            sut = SingleRepoView()
            sut.snp.makeConstraints {
                $0.width.equalTo(320)
            }
        }
        
        describe("#show") {
            beforeEach {
                let viewModel = SingleRepoViewModel(repoName: "Repo name",
                                                    repoDescription: "Repo description",
                                                    repoForksNumber: 3,
                                                    repoStarsNumber: 1,
                                                    authorName: "Author name",
                                                    authorImage: nil)
                sut.show(viewModel: viewModel)
            }
            
            context("when it builds its layout properly") {
                it("has a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
