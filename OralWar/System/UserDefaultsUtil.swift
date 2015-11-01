//
//  UserDefaultsUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/06.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// is debug mode
let USER_DEFAULTS_KEY_DEBUG = "debug"
// user id
let USER_DEFAULTS_KEY_USER_ID = "userid"
// user name
let USER_DEFAULTS_KEY_USER_NAME = "username"
// current user stage
let USER_DEFAULTS_KEY_USER_STAGE = "userstage"
// current user score
let USER_DEFAULTS_KEY_USER_SCORE = "userscore"
// list of items that the user has
let USER_DEFAULTS_KEY_USER_ITEMLIST = "useritemlist"
// list of bacterias that the user has
let USER_DEFAULTS_KEY_USER_BACTERIALIST = "userbacterialist"
// datetime that the user last updated
let USER_DEFAULTS_KEY_USER_UPDATEDAT = "userupdatedat"

// declare NSUserDefaults utility
class UserDefaultsUtil {
    
    // set default values
    class func initUserDefaults() {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return
        }
        let register = [
            USER_DEFAULTS_KEY_DEBUG: true,
            USER_DEFAULTS_KEY_USER_ID: 0,
            USER_DEFAULTS_KEY_USER_NAME: "",
            USER_DEFAULTS_KEY_USER_STAGE: 1,
            USER_DEFAULTS_KEY_USER_ITEMLIST: [],
            USER_DEFAULTS_KEY_USER_BACTERIALIST: [],
            USER_DEFAULTS_KEY_USER_UPDATEDAT: 0
        ]
        ud.registerDefaults(register)
    }
    
    // put debug mode
    class func putDebugMode(debug: Bool) {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return
        }
        ud.setBool(debug, forKey: USER_DEFAULTS_KEY_DEBUG)
        ud.synchronize()
    }
    
    // get debug mode
    class func getDebugMode() -> Bool {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return false
        }
        return ud.boolForKey(USER_DEFAULTS_KEY_DEBUG)
    }
    
    // put user info
    class func putUserInfo(user: User) {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return
        }
        ud.setInteger(user.getId(), forKey: USER_DEFAULTS_KEY_USER_ID)
        ud.setObject(user.getName(), forKey: USER_DEFAULTS_KEY_USER_NAME)
        ud.setInteger(user.getScore(), forKey: USER_DEFAULTS_KEY_USER_SCORE)
        ud.setInteger(user.getStage(), forKey: USER_DEFAULTS_KEY_USER_STAGE)
        ud.setObject(user.getItemlist(), forKey: USER_DEFAULTS_KEY_USER_ITEMLIST)
        ud.setObject(user.getBacterialist(), forKey: USER_DEFAULTS_KEY_USER_BACTERIALIST)
        ud.setObject(user.getUpdatedAt(), forKey: USER_DEFAULTS_KEY_USER_UPDATEDAT)
        ud.synchronize()
    }
    
    // get user info
    class func getUserInfo() -> User? {
        guard let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults() else {
            return nil
        }
        let user: User = User()
        user.setId(ud.integerForKey(USER_DEFAULTS_KEY_USER_ID))
        user.setName(ud.stringForKey(USER_DEFAULTS_KEY_USER_NAME)!)
        user.setScore(ud.integerForKey(USER_DEFAULTS_KEY_USER_SCORE))
        user.setStage(ud.integerForKey(USER_DEFAULTS_KEY_USER_STAGE))
        user.setItemlist(ud.arrayForKey(USER_DEFAULTS_KEY_USER_ITEMLIST) as! Array<Int>)
        user.setBacterialist(ud.arrayForKey(USER_DEFAULTS_KEY_USER_BACTERIALIST) as! Array<Int>)
        user.setUpdatedAt(ud.objectForKey(USER_DEFAULTS_KEY_USER_UPDATEDAT) as! NSTimeInterval)
        return user
    }
}