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
        
        // initialize user defaults
        UserDefaultsUtil.initUserDefaults()
        
        locationChanged(MENU)
    }
    
    // handling event
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url!.absoluteString
        if url.hasPrefix(ORAL_SCHEME) {
            
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
    fileprivate func startGame() {
        let gameViewController = self.storyboard!
            .instantiateViewController(withIdentifier: "gameview") 
        self.present(gameViewController, animated: false, completion: nil)
    }
    
    // location change
    fileprivate func locationChanged(_ res :String) {
        let url = Bundle.main.path(forResource: res, ofType: "html");
        let reqURL = URL(string: url!)
        let req = URLRequest(url: reqURL!)
        webView.loadRequest(req)
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    // Fix orientation of the screen to landscape at swift2
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
