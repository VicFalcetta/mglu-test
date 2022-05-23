import Foundation
import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class PullRequestListViewTests: QuickSpec {
    override func spec() {
        var sut: PullRequestListView!
        beforeEach {
            sut = PullRequestListView()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        }
        
        describe("#show") {
            beforeEach {
                let pullRequest = PullRequestViewModel(pullRequestName: "Pull Request Name",
                                                       pullRequestDate: "11/11/21",
                                                       pullRequestDesc: "Pull Request Description",
                                                       authorName: "Pull Request Author",
                                                       authorImage: nil)
                
                let pullList = [pullRequest, pullRequest, pullRequest]
                sut.show(viewModel: pullList)
            }
            
            context("when it builds its layout properly") {
                it("has a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
        
        describe("#showLoading") {
            beforeEach {
                sut.showLoading(isLoading: true)
            }
            
            context("when it builds its layout properly") {
                it("has a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
        
        describe("#showError") {
            beforeEach {
                sut.showError(hasError: true)
            }
            
            context("when it builds its layout properly") {
                it("has a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}


