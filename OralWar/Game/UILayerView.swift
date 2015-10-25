//
//  UILayerView.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/31.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import Foundation
import UIKit

protocol onClickDelegate {
    
    // call on click backbutton
    func onClickBack(sender: UIButton)
}

class UILayerView: UIView {

    // unify top y position
    let UILAYER_TOP_Y: CGFloat = 30.0
    // declare button rect size
    let BUTTON_RECT = CGRectMake(0, 0, 100, 40)
    // declare back button text
    let BUTTON_BACK_TEXT = "BACK"
    // declare function for click back button
    let BUTTON_BACK_FUNCTION: Selector = "onClickBack:"
    
    var delegate: onClickDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDelegate(_delegate :onClickDelegate) {
        delegate = _delegate
    }
    
    func setup(frame: CGRect) {

        // set back button
        let button = UIButton()
        button.frame = BUTTON_RECT
        button.backgroundColor = UIColor.redColor()
        button.layer.masksToBounds = true
        button.setTitle(BUTTON_BACK_TEXT, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Highlighted)
        button.layer.cornerRadius = 5.0
        button.layer.position = CGPoint(x: frame.width / 6, y: UILAYER_TOP_Y)
        button.addTarget(self, action: BUTTON_BACK_FUNCTION, forControlEvents: .TouchUpInside)
        
        self.addSubview(button)

        // get user info
        guard let user = UserDefaultsUtil.getUserInfo() else {
            return
        }
        // set user name
        let nameLabel = UILabel()
        nameLabel.text = "NAME : " + user.getName()
        nameLabel.frame = CGRectMake(0, 0, 100, 40)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.layer.position = CGPoint(x: frame.width - 100, y: UILAYER_TOP_Y)
        self.addSubview(nameLabel)
    }
    
    // call when click back button
    func onClickBack(sender: UIButton) {
        if let d = delegate {
            d.onClickBack(sender)
        }
    }
}
