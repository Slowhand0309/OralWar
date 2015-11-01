//
//  Stage.swift
//  OralWar
//
//  Created by MrSmall on 2015/11/01.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

class Stage {
    
    var id: Int // identifier
    var name: String // stage name
    var uri: String // stage uri
    
    init () {
        id = 0
        name = ""
        uri = ""
    }
    
    // get id
    func getId() -> Int {
        return id
    }
    
    // set id
    func setId(id: Int) {
        self.id = id
    }

    // get name
    func getName() -> String {
        return name
    }

    // set name
    func setName(name: String) {
        self.name = name
    }
    
    // get uri
    func getUri() -> String {
        return uri
    }
    
    // set uri
    func setUri(uri: String) {
        self.uri = uri
    }
}