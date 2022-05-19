import Foundation

@testable import mglu_test

final class RepoListViewControllerSpy: RepoListControllerType {
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
}
