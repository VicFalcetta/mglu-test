import Foundation
import Quick
import Nimble

@testable import mglu_test

final class RepoListPresenterTests: QuickSpec {
    override func spec() {
        var sut: RepoListPresenter!
        var repositorySpy: GitHubAppRepositorySpy!
        var controllerSpy: RepoListViewControllerSpy!
        
        beforeEach {
            repositorySpy = GitHubAppRepositorySpy()
            controllerSpy = RepoListViewControllerSpy()
            sut = RepoListPresenter(repository: repositorySpy)
            sut.viewController = controllerSpy
        }
        
        describe("#requestRepoList") {
            context("when request is successful and paginating is false") {
                beforeEach {
                    repositorySpy.shouldFailRequest = false
                    repositorySpy.repoListResponse = .stub()
                    sut.requestReposList(isPaginating: false)
                }
                
                it("should call repository's request requestRepoList") {
                    expect(repositorySpy.requestRepoListCount).to(equal(1))
                    expect(repositorySpy.sentPage).to(equal(1))
                }
                
                it("should call controller's showLoading with correct params") {
                    expect(controllerSpy.showScreenLoadingCount).to(equal(2))
                    expect(controllerSpy.sentIsLoadingParams).to(equal([true, false]))
                }
                
                it("should call controller's show with correct params") {
                    expect(controllerSpy.showCount).to(equal(1))
                    expect(controllerSpy.sentViewModel).to(equal(.stub()))
                }
            }
            
            context("when request is successful and paginating is true") {
                beforeEach {
                    repositorySpy.shouldFailRequest = false
                    repositorySpy.repoListResponse = .stub()
                    sut.requestReposList(isPaginating: true)
                }
                
                it("should call repository's request requestRepoList") {
                    expect(repositorySpy.requestRepoListCount).to(equal(1))
                    expect(repositorySpy.sentPage).to(equal(2))
                }
                
                it("should call controller's showPaginatingLoading with correct params") {
                    expect(controllerSpy.showPaginationLoadingCount).to(equal(1))
                    expect(controllerSpy.sentIsPaginating).to(beTrue())
                }
                
                it("should call controller's show with correct params") {
                    expect(controllerSpy.showCount).to(equal(1))
                    expect(controllerSpy.sentViewModel).to(equal(.stub()))
                }
            }
            
            context("when request has failed and is paginating is false") {
                beforeEach {
                    repositorySpy.shouldFailRequest = true
                    sut.requestReposList(isPaginating: false)
                }
                
                it("should call repository's request requestRepoList") {
                    expect(repositorySpy.requestRepoListCount).to(equal(1))
                    expect(repositorySpy.sentPage).to(equal(1))
                }
                
                it("should call controller's showLoading with correct params") {
                    expect(controllerSpy.showScreenLoadingCount).to(equal(2))
                    expect(controllerSpy.sentIsLoadingParams).to(equal([true, false]))
                }
                
                it("should call controller's show with correct params") {
                    expect(controllerSpy.showErrorCount).to(equal(1))
                    expect(controllerSpy.sentHasError).to(beTrue())
                }
            }
        }
    }
}
