import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class RepoListErrorViewTests: QuickSpec {
    override func spec() {
        var sut: RepoListErrorView!
        
        beforeEach {
            sut = RepoListErrorView()
            sut.snp.makeConstraints {
                $0.width.equalTo(320)
            }
        }
        
        describe("#init") {
            it("have a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
