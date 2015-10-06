//
//  Item.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/06.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

// item effect type
enum EffectType {
    case NONE // no effect
    case TIME // effect to time
    case DIG // effect to dig
    case MOVE_RATE // effect to move rate
    case MOVE_SPD // effect to move speed
}
import Foundation

// declare item class
class Item {
    
    var id: UInt16 // identifier
    var name: String // item name
    var effectType: EffectType // item effect type
    var effectValue: UInt32 // item effect value

    // construct
    init () {
        id = 0
        name = ""
        effectType = EffectType.NONE
        effectValue = 0
    }
    
    // get item id
    func getId() -> UInt16 {
        return id
    }
    
    // set item id
    func setId(id: UInt16) {
        self.id = id
    }
    
    // get item name
    func getName() -> String {
        return name
    }
    
    // set item name
    func setName(name: String) {
        self.name = name
    }
    
    // get item effect type
    func getEffectType() -> EffectType {
        return effectType
    }
    
    // set item effect type
    func setEffectType(effectType: EffectType) {
        self.effectType = effectType
    }
    
    // get item effect value
    func getEffectValue() -> UInt32 {
        return effectValue
    }
    
    // set item effect value
    func setEffectValue(effectValue: UInt32) {
        self.effectValue = effectValue
    }
}