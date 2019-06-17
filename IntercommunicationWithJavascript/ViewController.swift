//
//  ViewController.swift
//  IntercommunicationWithJavascript
//
//  Created by 石川 雅之 on 2019/06/17.
//  Copyright © 2019 usayuki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {

    private var wkWebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let config = WKWebViewConfiguration()
        let userController = WKUserContentController()
        userController.add(self, name: "double")
        config.userContentController = userController
        wkWebview = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(wkWebview)
        
        let path = Bundle.main.path(forResource: "index", ofType: "html")!
        let url = URL(fileURLWithPath: path, isDirectory: false)
        wkWebview.loadFileURL(url, allowingReadAccessTo: url)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "double":
            let numString = message.body as! String
            let number = Int(numString)!
            let result = number * 2
            wkWebview.evaluateJavaScript("window.double(\(result));", completionHandler: nil)
        default:
            break
        }
    }
}

