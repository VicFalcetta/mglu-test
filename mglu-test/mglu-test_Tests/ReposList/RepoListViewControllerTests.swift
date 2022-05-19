import Foundation
import Quick
import Nimble

@testable import mglu_test

final class RepoListViewControllerTests: QuickSpec {
    override func spec() {
        var sut: RepoListViewController!
        var presenterSpy: RepoListPresenterSpy!
        var viewDummy: ReposListView!
        
        beforeEach {
            presenterSpy = RepoListPresenterSpy()
            viewDummy = ReposListView()
            sut = RepoListViewController(presenter: presenterSpy,
                                         contentView: viewDummy)
        }
        
        describe("#viewDidLoad") {
            context("when controller is loaded successfully") {
                it("calls presenter's requestReposList") {
                    _ = sut.view
    
                    expect(presenterSpy.requestRepoListCount).to(equal(1))
                    expect(presenterSpy.sentIsPaginating).to(beFalse())
                }
                
                it("should set itself as table view delegate") {
                    let viewSpy = ReposListViewSpy()
                    sut = RepoListViewController(presenter: presenterSpy,
                                                 contentView: viewSpy)
                    _ = sut.view
                    
                    expect(viewSpy.reposTableDelegate).to(beAKindOf(RepoListViewController.self))
                }
            }
        }
        
        describe("#show") {
            var viewSpy: ReposListViewSpy!
            beforeEach {
                viewSpy = ReposListViewSpy()
                sut = RepoListViewController(presenter: presenterSpy,
                                             contentView: viewSpy)
            }
            
            it("should call view's spy show with correct params") {
                let viewModel: ReposListViewModel = .stub()
                sut.show(viewModel: viewModel)
                
                expect(viewSpy.sentViewModel).to(equal(viewModel))
                expect(viewSpy.showCount).to(equal(1))
            }
        }
        
        describe("#showLoading") {
            var viewSpy: ReposListViewSpy!
            beforeEach {
                viewSpy = ReposListViewSpy()
                sut = RepoListViewController(presenter: presenterSpy,
                                             contentView: viewSpy)
            }
            
            it("should call view's spy showLoading with correct params") {
                sut.showScreenLoading(isLoading: true)
                
                expect(viewSpy.sentIsLoading).to(beTrue())
                expect(viewSpy.showLoadingCount).to(equal(1))
            }
        }
    }
}
