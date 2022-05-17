import Foundation
import UIKit

enum GitHubAppFlow {
    case home
}

final class GitHubAppCoordinator {
    weak var currentViewController: UIViewController?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(flow: GitHubAppFlow) {
        switch flow {
        case .home:
            break
        }
    }
}
