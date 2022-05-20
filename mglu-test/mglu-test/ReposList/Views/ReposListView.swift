import Foundation
import UIKit
import SnapKit

final class ReposListView: UIView, ReposListViewType {
    var didPressTryAgain: (() -> Void)?
    
    var reposTableViewContentSize: CGFloat {
        return reposTable.contentSize.height
    }
    
    weak var reposTableDelegate: UITableViewDelegate?
    private var reposTableDataSource: UITableViewDataSource?

    private let reposTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(SingleRepoTableCell.self,
                       forCellReuseIdentifier: "repoSingleCell")
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
    
    private let errorView: RepoListErrorView = {
        let view = RepoListErrorView()
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
        addSubview(reposTable)
        addSubview(loadingIndicator)
        addSubview(errorView)
    }
    
    private func addConstraints() {
        reposTable.snp.makeConstraints {
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
            self?.didPressTryAgain?()
        }
    }
    
    private func createPaginationLoader() {
        let loadingFooterView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        reposTable.tableFooterView = loadingFooterView
        loadingFooterView.backgroundColor = .secondarySystemBackground
        
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.color = .systemOrange
        loadingSpinner.style = .large
        loadingSpinner.startAnimating()
        
        loadingFooterView.addSubview(loadingSpinner)
        loadingSpinner.snp.makeConstraints {
            $0.center.equalTo(loadingFooterView)
        }
    }
    
    func show(viewModel: ReposListViewModel) {
        reposTableDataSource = ReposListTableDataSource(reposList: viewModel)
        reposTable.dataSource = reposTableDataSource
        reposTable.delegate = reposTableDelegate
        reposTable.reloadData()
    }
    
    func showLoading(isLoading: Bool) {
        loadingIndicator.isHidden = !isLoading
        if isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    func showPaginationLoading(isPaginating: Bool) {
        if isPaginating {
            createPaginationLoader()
        } else {
            reposTable.tableFooterView = nil
        }
    }
    
    func showError(hasError: Bool = false) {
        errorView.isHidden = !hasError
    }
}
