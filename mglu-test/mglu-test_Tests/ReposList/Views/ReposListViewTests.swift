import Foundation
import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import mglu_test

final class ReposListViewTests: QuickSpec {
    override func spec() {
        var sut: ReposListView!
        
        beforeEach {
            sut = ReposListView()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        }
        
        describe("#show") {
            beforeEach {
                let singleRepo = SingleRepoViewModel(repoName: "Repo name",
                                                     repoDescription: "Repo description lorem ipsum",
                                                     repoForksNumber: 3,
                                                     repoStarsNumber: 1,
                                                     authorName: "Author name",
                                                     authorImage: nil)
                
                let viewModel = ReposListViewModel(repos: [singleRepo, singleRepo, singleRepo])
                sut.show(viewModel: viewModel)
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
        
        describe("#showPaginationLoading") {
            beforeEach {
                let singleRepo = SingleRepoViewModel(repoName: "Repo name",
                                                     repoDescription: "Repo description lorem ipsum",
                                                     repoForksNumber: 3,
                                                     repoStarsNumber: 1,
                                                     authorName: "Author name",
                                                     authorImage: nil)
                
                let viewModel = ReposListViewModel(repos: [singleRepo, singleRepo, singleRepo])
                sut.show(viewModel: viewModel)
                sut.showPaginationLoading(isPaginating: true)
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
