import Foundation
import UIKit
import WebKit
import SnapKit

final class PullRequestWebView: UIView {
    private let webView = WKWebView()
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .systemOrange
        indicator.isHidden = false
        return indicator
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        addConstraints()
        webView.navigationDelegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(webView)
        addSubview(loadingIndicator)
    }
    
    private func addConstraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func show(url: URL) {
        webView.load(URLRequest(url: url))
    }
}

extension PullRequestWebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
}
