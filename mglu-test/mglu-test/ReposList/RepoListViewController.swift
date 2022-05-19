import Foundation
import UIKit

final class RepoListViewController: UIViewController {
    weak var delegate: RepoListControllerDelegate?
    private let presenter: RepoListPresenterType
    private let contentView: ReposListViewType
    
    init(presenter: RepoListPresenterType,
         contentView: ReposListViewType = ReposListView()) {
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
        presenter.requestReposList(isPaginating: false)
        contentView.reposTableDelegate = self
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
}

extension RepoListViewController: RepoListControllerType {
    func show(viewModel: ReposListViewModel) {
        contentView.show(viewModel: viewModel)
    }
    
    func showScreenLoading(isLoading: Bool) {
        contentView.showLoading(isLoading: isLoading)
    }
}

extension RepoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at index \(indexPath.row)")
    }
}
