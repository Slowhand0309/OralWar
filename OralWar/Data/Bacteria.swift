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
    case stay_TYPE // stay here
    case front_BACK_TYPE // move front back
    case left_RIGHT_TYPE // move left right
    case circle_TYPE // move circle
    case randam_TYPE // move randam
}

enum ExpandType {
    // not implement ver 1.0
    case none
}

class Bacteria {
    
    var id: Int
    var rate: Float
    var cycle: Int
    var animType: AnimationType
    var expandType: ExpandType
    
    init () {
        id = 0
        rate = 0.0
        cycle = 0
        animType = AnimationType.stay_TYPE
        expandType = ExpandType.none
    }
    
    // set id
    func getId() -> Int {
        return id
    }
    
    // get id
    func setId(_ id: Int) {
        self.id = id
    }
    
    // get rate
    func getRate() -> Float {
        return rate
    }
    
    // set rate
    func setRate(_ rate: Float) {
        self.rate = rate
    }
    
    // get cycle
    func getCycle() ->Int {
        return cycle
    }
    
    // set cyclle
    func setCycle(_ cycle: Int) {
        self.cycle = cycle
    }
    
    // get animation type
    func getAnimType() -> AnimationType {
        return animType
    }
    
    // set animation type
    func setAnimType(_ animType: AnimationType) {
        self.animType = animType
    }
}
