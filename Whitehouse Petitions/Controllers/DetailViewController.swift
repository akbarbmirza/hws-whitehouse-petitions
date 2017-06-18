//
//  DetailViewController.swift
//  Whitehouse Petitions
//
//  Created by Akbar Mirza on 6/18/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import WebKit // for WKWebView

class DetailViewController: UIViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    
    // =========================================================================
    // Properties
    // =========================================================================
    
    // variable that references the WebView we'll be using
    var webView: WKWebView!
    // contains the dictionary of petition data
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // only continue if detailItem exists
        guard detailItem != nil else { return }
        
        if let body = detailItem["body"] {
            // set the html that our webView is going to load
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            
            // load the html that we specified
            webView.loadHTMLString(html, baseURL: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
