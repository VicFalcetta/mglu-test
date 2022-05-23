import Foundation
import UIKit

final class PullRequestListDataSource: NSObject, UITableViewDataSource {
    private let pullRequests: [PullRequestViewModel]
    
    init(pullRequests: [PullRequestViewModel]) {
        self.pullRequests = pullRequests
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullRequestCell",
                                                 for: indexPath) as? PullRequestListTableCell
        guard let cell = cell else { return UITableViewCell() }
        cell.show(viewModel: pullRequests[indexPath.row])
        return cell
    }
}
