import Foundation
import Quick
import Nimble

@testable import mglu_test

final class PullRequestListPresenterTests: QuickSpec {
    override func spec() {
        var sut: PullRequestListPresenter!
        var repositorySpy: GitHubAppRepositorySpy!
        var controllerSpy: PullRequestListControllerSpy!
        beforeEach {
            repositorySpy = GitHubAppRepositorySpy()
            controllerSpy = PullRequestListControllerSpy()
            sut = PullRequestListPresenter(repository: repositorySpy,
                                           repoOwner: "owner",
                                           repoName: "repository")
            sut.controller = controllerSpy
        }
        
        describe("#setupPullListData") {
            context("when request returns with an error") {
                beforeEach {
                    repositorySpy.shouldFailRequest = true
                    sut.setupPullListData()
                }
                
                it("should call repository's requestPullList") {
                    expect(repositorySpy.requestPullListCount).to(equal(1))
                    expect(repositorySpy.sentOwner).to(equal("owner"))
                    expect(repositorySpy.sentRepoName).to(equal("repository"))
                }
                
                it("should call controller's showLoading and showError") {
                    expect(controllerSpy.sentIsLoading).to(equal([true, false]))
                    expect(controllerSpy.sentHasError).to(beTrue())
                    expect(controllerSpy.showLoadingCount).to(equal(2))
                    expect(controllerSpy.showErrorCount).to(equal(1))
                }
            }
            
            context("when request returns with a success") {
                beforeEach {
                    let pullRequest = PullRequestListData.stub()
                    repositorySpy.shouldFailRequest = false
                    repositorySpy.pullListResponse = pullRequest
                    sut.setupPullListData()
                }
                
                it("should call repository's requestPullList") {
                    expect(repositorySpy.requestPullListCount).to(equal(1))
                    expect(repositorySpy.sentOwner).to(equal("owner"))
                    expect(repositorySpy.sentRepoName).to(equal("repository"))
                }
                
                it("should call controller's showLoading and showError") {
                    let viewModel = PullRequestViewModel.stub()
                    
                    expect(controllerSpy.sentIsLoading).to(equal([true, false]))
                    expect(controllerSpy.showLoadingCount).to(equal(2))
                    expect(controllerSpy.showCount).to(equal(1))
                    expect(controllerSpy.sentViewModel).to(equal(viewModel))
                }
            }
        }
    }
}
