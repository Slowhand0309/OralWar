//
//  ActionBase.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/25.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import SpriteKit

class ActionBase {
    var action: SKAction?
    
    init () {        
    }
    
    func create() {
    }
    
    func getAction() -> SKAction {
        return action!
    }
}