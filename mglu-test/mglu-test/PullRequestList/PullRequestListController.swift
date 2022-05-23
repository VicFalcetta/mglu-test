import Foundation
import UIKit

final class PullRequestListController: UIViewController {
    weak var delegate: PullRequestListControllerDelegate?
    private let presenter: PullRequestListPresenterType
    private let contentView: PullRequestListView
    
    init(presenter: PullRequestListPresenterType,
         contentView: PullRequestListView = PullRequestListView()) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindLayoutEvents()
        presenter.setupPullListData()
        contentView.pullTableDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func bindLayoutEvents() {
        contentView.didTapTryAgain = { [weak self] in
            self?.presenter.setupPullListData()
            self?.showError(hasError: false)
        }
    }
}

extension PullRequestListController: PullRequestListControllerType {
    func showError(hasError: Bool) {
        contentView.showError(hasError: hasError)
    }
    
    func showLoading(isLoading: Bool) {
        contentView.showLoading(isLoading: isLoading)
    }
    
    func show(viewModel: [PullRequestViewModel]) {
        contentView.show(viewModel: viewModel)
    }
}

extension PullRequestListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequestUrl = presenter.getPullRequestUrl(index: indexPath.row)
        delegate?.showPullRequestWebView(url: pullRequestUrl)
    }
}
