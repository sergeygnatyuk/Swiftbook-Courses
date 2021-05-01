//
//  WebViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 10.04.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    // Properties
    public var selectedCourse: String?
    public var courseURL = ""
    public var progressKey = "estimatedProgress"
    
    // UI
    @IBOutlet var webView: WKWebView!
    @IBOutlet var progressView: UIProgressView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCourse
        
        guard let url = URL(string: courseURL) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if keyPath == progressKey {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    //MARK: - Public
    
    public func showProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 1
        }, completion: nil)
    }
    
    public func hideProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 0
        }, completion: nil)
    }
}
