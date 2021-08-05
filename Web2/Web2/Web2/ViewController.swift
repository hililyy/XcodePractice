//
//  ViewController.swift
//  Web2
//
//  Created by 강조은 on 2021/08/06.
//

import WebKit
import UIKit

class ViewController: UIViewController , WKNavigationDelegate{
    
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }


}

