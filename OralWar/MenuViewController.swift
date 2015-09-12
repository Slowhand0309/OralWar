//
//  GameViewController.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import UIKit
import SpriteKit

let ORAL_SCHEME = "oral://view/"

let MENU = "menu"
let GAMESTART = "gamestart"
let BACTERIA_LIST = "bacterialist"
let ITEM_LIST = "itemlist"

let GAME_VIEW_URL = ORAL_SCHEME + GAMESTART
let BACTERIA_LIST_URL = ORAL_SCHEME + BACTERIA_LIST
let ITEM_LIST_URL = ORAL_SCHEME + ITEM_LIST

class MenuViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationChanged(MENU)
    }
    
    // handling event
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.URL!.absoluteString
        if url!.hasPrefix(ORAL_SCHEME) {
            
            if url == GAME_VIEW_URL {
                startGame()
            } else if url == BACTERIA_LIST_URL {
                locationChanged(BACTERIA_LIST)
            } else if url == ITEM_LIST_URL {
                locationChanged(ITEM_LIST)
            }
            return false
        }
        return true
    }

    // Screen transition GameViewController.
    private func startGame() {
        let gameViewController = self.storyboard!
            .instantiateViewControllerWithIdentifier("gameview") as! UIViewController
        self.presentViewController(gameViewController, animated: false, completion: nil)
    }
    
    // location change
    private func locationChanged(res :String) {
        var url = NSBundle.mainBundle().pathForResource(res, ofType: "html");
        let reqURL = NSURL(string: url!)
        let req = NSURLRequest(URL: reqURL!)
        webView.loadRequest(req)
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