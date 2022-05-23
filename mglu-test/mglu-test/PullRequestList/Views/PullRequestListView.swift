import Foundation
import UIKit
import SnapKit

final class PullRequestListView: UIView {
    var didTapTryAgain: (() -> Void)?
    weak var pullTableDelegate: UITableViewDelegate?
    private var pullTableDataSource: UITableViewDataSource?
    
    private let pullTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(PullRequestListTableCell.self,
                       forCellReuseIdentifier: "pullRequestCell")
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 80
        return table
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .systemOrange
        indicator.isHidden = true
        return indicator
    }()
    
    private let errorView: PullRequestListErrorView = {
        let view = PullRequestListErrorView()
        view.isHidden = true
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addConstraints()
        addActions()
        backgroundColor = .systemBackground
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(pullTableView)
        addSubview(loadingIndicator)
        addSubview(errorView)
    }
    
    private func addConstraints() {
        pullTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        errorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func addActions() {
        errorView.didPressTryAgain = { [weak self] in
            self?.didTapTryAgain?()
        }
    }
    
    func show(viewModel: [PullRequestViewModel]) {
        pullTableDataSource = PullRequestListDataSource(pullRequests: viewModel)
        pullTableView.dataSource = pullTableDataSource
        pullTableView.delegate = pullTableDelegate
        pullTableView.reloadData()
    }
    
    func showLoading(isLoading: Bool) {
        loadingIndicator.isHidden = !isLoading
        if isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    func showError(hasError: Bool = false) {
        errorView.isHidden = !hasError
    }
}
