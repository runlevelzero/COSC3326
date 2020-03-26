//
//  LinkedinViewController.swift
//  Assignment 3 - ePortfolio
//
//  Created by Ruben Ruiz on 3/5/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit
import WebKit

class LinkedinViewController: UIViewController, WKUIDelegate {
    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://linkedin.com/in/runlevel0")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
