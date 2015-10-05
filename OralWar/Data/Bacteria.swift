//
//  Bacteria.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/05.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// move animation type
enum AnimationType {
    case STAY_TYPE // stay here
    case FRONT_BACK_TYPE // move front back
    case LEFT_RIGHT_TYPE // move left right
    case CIRCLE_TYPE // move circle
    case RANDAM_TYPE // move randam
}

enum ExpandType {
    // not implement ver 1.0
    case NONE
}

class Bacteria {
    
    var id: UInt16
    var rate: Float32
    var cycle: UInt16
    var animType: AnimationType
    var expandType: ExpandType
    
    init () {
        id = 0
        rate = 0.0
        cycle = 0
        animType = AnimationType.STAY_TYPE
        expandType = ExpandType.NONE
    }
    
    // set id
    func getId() -> UInt16 {
        return id
    }
    
    // get id
    func setId(id: UInt16) {
        self.id = id
    }
    
    // get rate
    func getRate() -> Float32 {
        return rate
    }
    
    // set rate
    func setRate(rate: Float32) {
        self.rate = rate
    }
    
    // get cycle
    func getCycle() ->UInt16 {
        return cycle
    }
    
    // set cyclle
    func setCycle(cycle: UInt16) {
        self.cycle = cycle
    }
    
    // get animation type
    func getAnimType() -> AnimationType {
        return animType
    }
    
    // set animation type
    func setAnimType(animType: AnimationType) {
        self.animType = animType
    }
}