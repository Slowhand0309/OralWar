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
    
    init () {
        id = 0
        name = ""
        stage = 0
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
}
