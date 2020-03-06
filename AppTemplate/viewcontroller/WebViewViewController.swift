import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview: WKWebView!
    var urlStr:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        initData()
    }
    
    func initView() {
        self.webview.navigationDelegate = self
        self.webview.uiDelegate = self
    }
    
    func initData() {
        guard let url = URL(string: self.urlStr) else{
            print("Url is invalid: \(self.urlStr)")
            dismiss(animated: true, completion: nil)
            return
        }
        let urlRequest = URLRequest(url: url)
        self.webview.load(urlRequest)
    }
    
    // MARK:- WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        print("decidePolicyFor")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
    }
}
