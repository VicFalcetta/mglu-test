import Foundation
import UIKit
import SnapKit

final class PullRequestListTableCell: UITableViewCell {
    private let pullRequestView = PullRequestListCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHirarchy()
        addConstraints()
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        selectionStyle = .none
    }
    
    private func buildViewHirarchy() {
        contentView.addSubview(pullRequestView)
    }
    
    private func addConstraints() {
        pullRequestView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
    func show(viewModel: PullRequestViewModel) {
        pullRequestView.show(viewModel: viewModel)
        layoutIfNeeded()
    }
}
