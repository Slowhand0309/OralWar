//
//  GameViewController.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import UIKit
import SpriteKit

class MenuViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var url = NSBundle.mainBundle().pathForResource("menu", ofType: "html");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reqURL = NSURL(string: url!)
        let req = NSURLRequest(URL: reqURL!)
        webView.loadRequest(req)
    }
    
    // handling event
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        println(request)
        println(navigationType)
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}