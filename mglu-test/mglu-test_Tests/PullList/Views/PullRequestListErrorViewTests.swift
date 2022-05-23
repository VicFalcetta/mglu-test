import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class PullRequestListErrorViewTests: QuickSpec {
    override func spec() {
        var sut: PullRequestListErrorView!
        beforeEach {
            sut = PullRequestListErrorView()
            sut.snp.makeConstraints {
                $0.width.equalTo(320)
            }
        }
        
        describe("#init") {
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
