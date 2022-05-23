import Foundation
import UIKit
import SnapKit

final class PullRequestListErrorView: UIView {
    var didPressTryAgain: (() -> Void)?

    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 16
        return stack
    }()
    
    private let errorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Houve um erro ao carregar Pull Requests"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let errorDescLabel: UILabel = {
        let label = UILabel()
        label.text = "Não foi possível carregar a lista de Pull Requests do Repositório. Gostaria de tentar carregar novamente?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let tryAgainButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .systemOrange
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
        configuration.title = "Tentar novamente"
        configuration.baseForegroundColor = .label
        button.configuration = configuration
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        buildViewHierarchy()
        addContraints()
        addActions()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(contentStack)
        contentStack.addArrangedSubview(errorTitleLabel)
        contentStack.addArrangedSubview(errorDescLabel)
        contentStack.setCustomSpacing(24, after: errorDescLabel)
        contentStack.addArrangedSubview(tryAgainButton)
    }
    
    private func addContraints() {
        contentStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    private func addActions() {
        tryAgainButton.addTarget(self, action: #selector(tapTryAgain), for: .touchUpInside)
    }
    
    @objc
    private func tapTryAgain() {
        didPressTryAgain?()
    }
}
