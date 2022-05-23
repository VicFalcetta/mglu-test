import Foundation
import UIKit

final class PullRequestWebViewController: UIViewController {
    private var contentView: PullRequestWebView
    private let url: String
    
    init(contentView: PullRequestWebView,
         url: String) {
        self.contentView = contentView
        self.url = url
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
        guard let url = URL(string: url) else { return }
        contentView.show(url: url)
    }
}
