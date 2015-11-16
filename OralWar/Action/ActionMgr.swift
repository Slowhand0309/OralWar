//
//  ActionMgr.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/25.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation
import SpriteKit

// SKAction manager class
class ActionMgr {
 
    // create action for bacteria
    func createAction(type: AnimationType) -> ActionBase? {
        var action: ActionBase?
        switch type {
        case AnimationType.STAY_TYPE: // stay here
            break
        case AnimationType.FRONT_BACK_TYPE: // move front back
            break
        case AnimationType.LEFT_RIGHT_TYPE: // move left right
            break
        case AnimationType.CIRCLE_TYPE: // move circle
            action = ActionRotation(isRight: true)
            break
        case AnimationType.RANDAM_TYPE: // move randam
            break
        }
        return action
    }
}