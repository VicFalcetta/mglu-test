import Foundation
import UIKit
import SnapKit

final class ReposListView: UIView {
    weak var reposTableDelegate: UITableViewDelegate?
    private var reposTableDataSource: UITableViewDataSource?

    private let reposTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(SingleRepoTableCell.self,
                       forCellReuseIdentifier: "repoSingleCell")
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(reposTable)
    }
    
    private func addConstraints() {
        reposTable.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func show(viewModel: ReposListViewModel) {
        reposTableDataSource = ReposListTableDataSource(reposList: viewModel)
        reposTable.dataSource = reposTableDataSource
    }
}
