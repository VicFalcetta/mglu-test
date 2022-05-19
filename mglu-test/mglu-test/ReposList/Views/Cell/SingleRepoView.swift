import Foundation
import UIKit
import SnapKit

final class SingleRepoView: UIView {
    private let repoNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let repoDescLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let repoAuthorImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemGray
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let repoAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    private let repoForksNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemOrange
        return label
    }()
    
    private let repoStarsNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemOrange
        return label
    }()
    
    private let repoNameDescStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        return stack
    }()
    
    private let repoAuthorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 8
        return stack
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                 leading: 16,
                                                                 bottom: 8,
                                                                 trailing: 16)
        return stack
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addContraints()
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
    }
    
    private func buildViewHierarchy() {
        repoNameDescStackView.addArrangedSubview(repoNameLabel)
        repoNameDescStackView.setCustomSpacing(4, after: repoNameLabel)
        repoNameDescStackView.addArrangedSubview(repoDescLabel)
        repoNameDescStackView.addArrangedSubview(repoStarsNumberLabel)
        repoNameDescStackView.setCustomSpacing(4, after: repoStarsNumberLabel)
        repoNameDescStackView.addArrangedSubview(repoForksNumberLabel)
        
        repoAuthorStackView.addArrangedSubview(repoAuthorImage)
        repoAuthorStackView.addArrangedSubview(repoAuthorNameLabel)
        
        contentStack.addArrangedSubview(repoNameDescStackView)
        contentStack.addArrangedSubview(repoAuthorStackView)
        
        addSubview(contentStack)
    }
    
    private func addContraints() {
        repoAuthorImage.snp.makeConstraints {
            $0.size.equalTo(48)
        }
        
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func show(viewModel: SingleRepoViewModel) {
        repoNameLabel.text = viewModel.repoName
        repoDescLabel.text = viewModel.repoDescription
        repoAuthorNameLabel.text = viewModel.authorName
        repoStarsNumberLabel.text = "Stars: \(viewModel.repoStarsNumber)"
        repoForksNumberLabel.text = "Forks: \(viewModel.repoForksNumber)"
        repoAuthorImage.image = setupImage(image: viewModel.authorImage)
    }
    
    private func setupImage(image: UIImage?) -> UIImage {
        if let image = image {
            return image
        } else {
            return UIImage(named: "genericImage") ?? UIImage()
        }
    }
}
