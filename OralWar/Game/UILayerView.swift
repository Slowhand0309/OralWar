//
//  UILayerView.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/31.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import Foundation
import UIKit

// delegate for click
protocol onClickDelegate {
    
    // call on click backbutton
    func onClickBack(_ sender: UIButton)
}

// View for UILayer
class UILayerView: UIView {

    // unify top y position
    let UILAYER_TOP_Y: CGFloat = 30.0
    // declare button rect size
    let BUTTON_RECT = CGRect(x: 0, y: 0, width: 100, height: 40)
    // declare back button text
    let BUTTON_BACK_TEXT = "BACK"
    // declare function for click back button
    let BUTTON_BACK_FUNCTION: Selector = #selector(UILayerView.onClickBack(_:))
    
    // declare debug font color
    let DEBUG_FONT_COLOR = UIColor.white
    
    var delegate: onClickDelegate!
    
    // initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // set delegate
    func setDelegate(_ _delegate :onClickDelegate) {
        delegate = _delegate
    }
    
    // setup
    func setup(_ frame: CGRect) {

        setBackButton()

        // get user info
        guard let user = UserDefaultsUtil.getUserInfo() else {
            return
        }
        setSwitchBacteriaButton()
        setSwitchItemButton()
        printDebug(user)
    }
    
    // set back button
    func setBackButton() {
        // set back button
        let button = UIButton()
        button.frame = BUTTON_RECT
        button.backgroundColor = UIColor.red
        button.layer.masksToBounds = true
        button.setTitle(BUTTON_BACK_TEXT, for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.setTitleColor(UIColor.yellow, for: UIControlState.highlighted)
        button.layer.cornerRadius = 5.0
        button.layer.position = CGPoint(x: frame.width / 6, y: UILAYER_TOP_Y)
        button.addTarget(self, action: BUTTON_BACK_FUNCTION, for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    // set switch bacteria button
    func setSwitchBacteriaButton() {
        // TODO
    }
    
    // set switch item button
    func setSwitchItemButton() {
        
    }
    
    // print for debug
    func printDebug(_ userInfo: User) {
        let debug = UserDefaultsUtil.getDebugMode()
        // show debug info
        if debug {
            var debugMsg: String = "ID : " + String(userInfo.getId()) + ","
            debugMsg += "NAME : " + userInfo.getName() + ","
            debugMsg += "ITEM : " + String(userInfo.getItemlist().count) + ","
            debugMsg += "BACTERIA : " + String(userInfo.getBacterialist().count)
            
            // set debug msg
            let debugLabel = UILabel()
            debugLabel.text = debugMsg
            debugLabel.font = UIFont.systemFont(ofSize: 10)
            debugLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
            debugLabel.textColor = DEBUG_FONT_COLOR
            debugLabel.layer.position = CGPoint(x: frame.width - 100, y: UILAYER_TOP_Y)
            self.addSubview(debugLabel)
            
            // set 
            userInfo.getId()
        }
    }
    
    // call when click back button
    func onClickBack(_ sender: UIButton) {
        if let d = delegate {
            d.onClickBack(sender)
        }
    }
}
