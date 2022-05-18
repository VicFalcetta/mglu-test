import Foundation
import UIKit

final class ReposListTableDataSource: NSObject, UITableViewDataSource {
    private let reposList: ReposListViewModel
    
    init(reposList: ReposListViewModel) {
        self.reposList = reposList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposList.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoSingleCell",
                                                 for: indexPath) as? SingleRepoTableCell
        guard let cell = cell else { return UITableViewCell() }
        cell.show(viewModel: reposList.repos[indexPath.row])
        return cell
    }
}
