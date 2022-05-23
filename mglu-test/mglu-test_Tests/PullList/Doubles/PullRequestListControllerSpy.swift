import Foundation

@testable import mglu_test

final class PullRequestListControllerSpy: PullRequestListControllerType {
    private(set) var sentHasError: Bool?
    private(set) var showErrorCount = 0
    func showError(hasError: Bool) {
        sentHasError = hasError
        showErrorCount += 1
    }
    
    private(set) var sentIsLoading: [Bool] = []
    private(set) var showLoadingCount = 0
    func showLoading(isLoading: Bool) {
        sentIsLoading.append(isLoading)
        showLoadingCount += 1
    }
    
    private(set) var sentViewModel: [PullRequestViewModel]?
    private(set) var showCount = 0
    func show(viewModel: [PullRequestViewModel]) {
        sentViewModel = viewModel
        showCount += 1
    }
}
