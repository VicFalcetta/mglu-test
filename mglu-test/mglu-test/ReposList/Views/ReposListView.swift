import Foundation
import UIKit
import SnapKit

final class ReposListView: UIView, ReposListViewType {
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
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addConstraints()
        backgroundColor = .systemBackground
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(reposTable)
        addSubview(loadingIndicator)
    }
    
    private func addConstraints() {
        reposTable.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
}
