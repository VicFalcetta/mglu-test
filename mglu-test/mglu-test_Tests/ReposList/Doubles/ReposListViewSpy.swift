import Foundation
import UIKit

@testable import mglu_test

final class ReposListViewSpy: UIView, ReposListViewType {
    var didPressTryAgain: (() -> Void)?
    var reposTableViewContentSize: CGFloat = 640
    weak var reposTableDelegate: UITableViewDelegate?
    
    private(set) var sentIsLoading: Bool?
    private(set) var showLoadingCount = 0
    func showLoading(isLoading: Bool) {
        sentIsLoading = isLoading
        showLoadingCount += 1
    }
    
    private(set) var sentViewModel: ReposListViewModel?
    private(set) var showCount = 0
    func show(viewModel: ReposListViewModel) {
        sentViewModel = viewModel
        showCount += 1
    }
    
    private(set) var sentIsPaginating: Bool?
    private(set) var showPaginationLoadingCount = 0
    func showPaginationLoading(isPaginating: Bool) {
        sentIsPaginating = isPaginating
        showPaginationLoadingCount += 1
    }
    
    private(set) var sentHasError: Bool?
    private(set) var showErrorCount = 0
    func showError(hasError: Bool) {
        sentHasError = hasError
        showErrorCount += 1
    }
}
