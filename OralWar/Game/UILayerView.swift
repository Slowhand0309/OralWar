//
//  UILayerView.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/31.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import Foundation
import UIKit

class UILayerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(frame: CGRect) {
        // sample
        let button = UIButton()
        button.frame = CGRectMake(0, 0, 100, 40)
        button.backgroundColor = UIColor.redColor()
        button.layer.masksToBounds = true
        button.setTitle("back", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Highlighted)
        button.layer.cornerRadius = 5.0
        button.layer.position = CGPoint(x: frame.width / 4, y: 50)
        button.addTarget(self, action: "onClickBack:", forControlEvents: .TouchUpInside)
        
        self.addSubview(button)
    }
    
    func onClickBack(sender: UIButton) {
        print("onClickBack") // TODO screen back
    }
}
