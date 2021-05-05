//
//  WebViewController.swift
//  NYTReader
//
//  Created by Tambanco on 12.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate
{
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Properties
    var passingURL = ""
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let myURL = URL(string: "\(passingURL)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
           if keyPath == "estimatedProgress"
           {
               progressView.progress = Float(webView.estimatedProgress)
           }
       }

    @IBAction func reloadPage(_ sender: UIBarButtonItem)
    {
        webView.reload()
    }
}

