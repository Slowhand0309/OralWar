//
//  User.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/06.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// declare user class
class User {
    
    var id: UInt32 // identifier
    var name: String // user name
    var stage: UInt32 // user current stage
    var score: UInt32 // user score
    var itemlist: [UInt16] = [] // user has itemlist
    var bacterialist: [UInt16] = [] // user has bacterialist
    var updatedat: NSTimeInterval
    
    init () {
        id = 0
        name = ""
        stage = 0
        score = 0
        updatedat = 0
    }
    
    // get id
    func getId() -> UInt32 {
        return id
    }
    
    // set id
    func setId(id: UInt32) {
        self.id = id
    }
    
    // get user name
    func getName() -> String {
        return name
    }
    
    // set user name
    func setName(name: String) {
        self.name = name
    }
    
    // get current stage
    func getStage() -> UInt32 {
        return stage
    }
    
    // set current stage
    func setStage(stage: UInt32) {
        self.stage = stage
    }
    
    // get user score
    func getScore() -> UInt32 {
        return score
    }
    
    // set user score
    func setScore(score: UInt32) {
        self.score = score
    }
    
    // get user item list
    func getItemlist() -> Array<UInt16> {
        return itemlist
    }
    
    // add user item list
    func addItemList(id: UInt16) {
        self.itemlist.append(id)
    }
    
    // get user bacteria list
    func getBacterialist() -> Array<UInt16> {
        return bacterialist
    }
    
    // add user bacteria list
    func addBacterialist(id: UInt16) {
        self.bacterialist.append(id)
    }
    
    // get updated at
    func getUpdatedAt() -> NSTimeInterval {
        return updatedat
    }
    
    // set updated at
    func setUpdatedAt(time: NSTimeInterval) {
        self.updatedat = time
    }
}
