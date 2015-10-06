//
//  UserDefaultsUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/06.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// declare NSUserDefaults utility
class UserDefaultsUtil {
    
    // put debug mode
    class func putDebugMode(debug: Bool) {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return
        }
        ud.setObject(debug, forKey: "debug")
    }
    
    // get debug mode
    class func getDebugMode() -> Bool {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return false
        }
        return ud.objectForKey("debug") as! Bool
    }
}