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
        button.frame = CGRectMake(0, 0, 200, 40)
        button.backgroundColor = UIColor.redColor()
        button.layer.masksToBounds = true
        button.setTitle("button", forState: UIControlState.Normal)
        button.layer.cornerRadius = 5.0
        button.layer.position = CGPoint(x: frame.width / 2, y: 200)
        
        self.addSubview(button)
    }
}
