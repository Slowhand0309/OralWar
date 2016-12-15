//
//  Item.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/06.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

// item effect type
enum EffectType {
    case none // no effect
    case time // effect to time
    case dig // effect to dig
    case move_RATE // effect to move rate
    case move_SPD // effect to move speed
}
import Foundation

// declare item class
class Item {
    
    var id: Int // identifier
    var name: String // item name
    var effectType: EffectType // item effect type
    var effectValue: Int // item effect value

    // construct
    init () {
        id = 0
        name = ""
        effectType = EffectType.none
        effectValue = 0
    }
    
    // get item id
    func getId() -> Int {
        return id
    }
    
    // set item id
    func setId(_ id: Int) {
        self.id = id
    }
    
    // get item name
    func getName() -> String {
        return name
    }
    
    // set item name
    func setName(_ name: String) {
        self.name = name
    }
    
    // get item effect type
    func getEffectType() -> EffectType {
        return effectType
    }
    
    // set item effect type
    func setEffectType(_ effectType: EffectType) {
        self.effectType = effectType
    }
    
    // get item effect value
    func getEffectValue() -> Int {
        return effectValue
    }
    
    // set item effect value
    func setEffectValue(_ effectValue: Int) {
        self.effectValue = effectValue
    }
}
