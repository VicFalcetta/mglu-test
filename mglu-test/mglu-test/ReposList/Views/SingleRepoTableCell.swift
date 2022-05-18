import Foundation
import UIKit
import SnapKit

final class SingleRepoTableCell: UITableViewCell {
    private var singleRepoView = SingleRepoView()
    
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
        contentView.addSubview(singleRepoView)
    }
    
    private func addConstraints() {
        singleRepoView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
    func show(viewModel: SingleRepoViewModel) {
        singleRepoView.show(viewModel: viewModel)
        layoutIfNeeded()
    }
}
