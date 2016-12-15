//
//  ActionRotation.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/25.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import SpriteKit

class ActionRotation : ActionBase {
    
    var isRight : Bool
    
    init (isRight: Bool) {
        self.isRight = isRight
    }
    
    override func create() {
        let moveRights: SKAction = SKAction.moveBy(x: 100.0, y: 0.0, duration: 1.0)
        action = SKAction.sequence([moveRights])
    }
}
