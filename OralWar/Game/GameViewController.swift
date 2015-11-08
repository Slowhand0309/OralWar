//
//  GameViewController.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, onClickDelegate {

    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // view did appear
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        /* Set the scale mode to scale to fit the window */
        let scene = GameScene(size: view.frame.size)
        scene.scaleMode = .Fill // for landscape
        skView.presentScene(scene)
        
        if !setup(scene) {
            // error alert
            let alertCtl = UIAlertController(title: "ERROR", message: "failed setup", preferredStyle: UIAlertControllerStyle.Alert)
            let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Default,
                handler:{
                    (action:UIAlertAction!) -> Void in
                    let menuViewController = self.storyboard!
                        .instantiateViewControllerWithIdentifier("menuview")
                    self.presentViewController(menuViewController, animated: false, completion: nil)
            })
            alertCtl.addAction(defaultAction)
            self.presentViewController(alertCtl, animated: true, completion: nil)
        }
    }
    
    // set up for ui, user info
    func setup(scene: GameScene) -> Bool {
        /* Set UI layer view */
        let uiView = UILayerView(frame: self.view!.frame)
        uiView.setDelegate(self)
        scene.setUiLayerView(uiView)
        
        /* Set User */
        guard let user = UserDefaultsUtil.getUserInfo() else {
            return false;
        }
        scene.setUser(user)
        
        return scene.setUp()
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }

    // Fix orientation of the screen to landscape at swift2
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // back menu view
    func onClickBack(sender: UIButton) {
        let menuViewController = self.storyboard!
            .instantiateViewControllerWithIdentifier("menuview")
        self.presentViewController(menuViewController, animated: false, completion: nil)
    }
}
