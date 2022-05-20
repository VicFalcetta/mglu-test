import Foundation

@testable import mglu_test

final class RepoListViewControllerSpy: RepoListControllerType {
    private(set) var sentIsPaginating: Bool?
    private(set) var showPaginationLoadingCount = 0
    func showPaginationLoading(isPaginating: Bool) {
        sentIsPaginating = isPaginating
        showPaginationLoadingCount += 1
    }
    
    private(set) var sentViewModel: ReposListViewModel?
    private(set) var showCount = 0
    func show(viewModel: ReposListViewModel) {
        sentViewModel = viewModel
        showCount += 1
    }
    
    private(set) var sentIsLoadingParams: [Bool] = []
    private(set) var showScreenLoadingCount = 0
    func showScreenLoading(isLoading: Bool) {
        sentIsLoadingParams.append(isLoading)
        showScreenLoadingCount += 1
    }
    
    private(set) var sentHasError: Bool?
    private(set) var showErrorCount = 0
    func showError(hasError: Bool) {
        sentHasError = hasError
        showErrorCount += 1
    }
}
