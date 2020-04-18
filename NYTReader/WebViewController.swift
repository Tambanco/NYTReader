//
//  WebViewController.swift
//  NYTReader
//
//  Created by Tambanco on 12.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var passingURL = ""
    
   var webView: WKWebView!
    
    
   override func viewDidLoad() {
      super.viewDidLoad()
    
    
    let myURL = URL(string: "\(passingURL)")
      let myRequest = URLRequest(url: myURL!)
      webView.load(myRequest)
   }
   override func loadView() {
      let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
      webView.uiDelegate = self
      view = webView
   }
    @IBAction func reloadPage(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
}
