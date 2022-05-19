import Foundation
import UIKit

@testable import mglu_test

final class ReposListViewSpy: UIView, ReposListViewType {
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
}
