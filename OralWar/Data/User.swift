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
    
    var id: Int // identifier
    var name: String // user name
    var stage: Int // user current stage
    var score: Int // user score
    var itemlist: [Int] = [] // user has itemlist
    var bacterialist: [Int] = [] // user has bacterialist
    var updatedat: NSTimeInterval
    
    init () {
        id = 0
        name = ""
        stage = 0
        score = 0
        updatedat = 0
    }
    
    // get id
    func getId() -> Int {
        return id
    }
    
    // set id
    func setId(id: Int) {
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
    func getStage() -> Int {
        return stage
    }
    
    // set current stage
    func setStage(stage: Int) {
        self.stage = stage
    }
    
    // get user score
    func getScore() -> Int {
        return score
    }
    
    // set user score
    func setScore(score: Int) {
        self.score = score
    }
    
    // get user item list
    func getItemlist() -> Array<Int> {
        return itemlist
    }
    
    // set user item list
    func setItemlist(list: Array<Int>) {
        self.itemlist = list
    }
    
    // add user item list
    func addItemList(id: Int) {
        self.itemlist.append(id)
    }
    
    // get user bacteria list
    func getBacterialist() -> Array<Int> {
        return bacterialist
    }
    
    // set user bacteria list
    func setBacterialist(list: Array<Int>) {
        self.bacterialist = list
    }
    
    // add user bacteria list
    func addBacterialist(id: Int) {
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
