import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class PullRequestListCellViewTests: QuickSpec {
    override func spec() {
        var sut: PullRequestListCellView!
        
        beforeEach {
            sut = PullRequestListCellView()
            sut.snp.makeConstraints {
                $0.width.equalTo(320)
            }
        }
        
        describe("#show") {
            beforeEach {
                let viewModel = PullRequestViewModel(pullRequestName: "Pull Request",
                                                     pullRequestDate: "02/11/21",
                                                     pullRequestDesc: "Pull request description here",
                                                     authorName: "Pull request author",
                                                     authorImage: nil)
                sut.show(viewModel: viewModel)
            }

            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
