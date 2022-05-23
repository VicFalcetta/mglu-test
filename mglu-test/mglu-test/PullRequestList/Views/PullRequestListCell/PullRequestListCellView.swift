import Foundation
import SnapKit
import UIKit
import SwiftUI

final class PullRequestListCellView: UIView {
    private let pullTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .label
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let pullDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let pullDescLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private let pullAuthorImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemGray
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let pullAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    private let pullAuthorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 8
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                 leading: 16,
                                                                 bottom: 8,
                                                                 trailing: 16)
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addConstraints()
        backgroundColor = .secondarySystemBackground
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        titleStackView.addArrangedSubview(pullTitleLabel)
        titleStackView.addArrangedSubview(pullDateLabel)
        
        pullAuthorStackView.addArrangedSubview(pullAuthorImage)
        pullAuthorStackView.addArrangedSubview(pullAuthorNameLabel)
        
        contentStack.addArrangedSubview(titleStackView)
        contentStack.setCustomSpacing(8, after: titleStackView)
        contentStack.addArrangedSubview(pullDescLabel)
        contentStack.addArrangedSubview(pullAuthorStackView)
        
        addSubview(contentStack)
    }
    
    private func addConstraints() {
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pullAuthorImage.snp.makeConstraints {
            $0.size.equalTo(48)
        }
    }
    
    func show(viewModel: PullRequestViewModel) {
        pullTitleLabel.text = viewModel.pullRequestName
        pullDateLabel.text = viewModel.pullRequestDate
        pullDescLabel.text = viewModel.pullRequestDesc
        pullAuthorImage.image = setupImage(image: viewModel.authorImage)
        pullAuthorNameLabel.text = viewModel.authorName
    }
    
    private func setupImage(image: UIImage?) -> UIImage {
        if let image = image {
            return image
        } else {
            return UIImage(named: "genericImage") ?? UIImage()
        }
    }
}
