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
        let ud = UserDefaults.standard
        let register = [
            USER_DEFAULTS_KEY_DEBUG: true,
            USER_DEFAULTS_KEY_USER_ID: 0,
            USER_DEFAULTS_KEY_USER_NAME: "",
            USER_DEFAULTS_KEY_USER_STAGE: 1,
            USER_DEFAULTS_KEY_USER_ITEMLIST: [],
            USER_DEFAULTS_KEY_USER_BACTERIALIST: [],
            USER_DEFAULTS_KEY_USER_UPDATEDAT: 0
        ] as [String : Any]
        ud.register(defaults: register)
    }
    
    // put debug mode
    class func putDebugMode(_ debug: Bool) {
        let ud = UserDefaults.standard
        ud.set(debug, forKey: USER_DEFAULTS_KEY_DEBUG)
        ud.synchronize()
    }
    
    // get debug mode
    class func getDebugMode() -> Bool {
        let ud = UserDefaults.standard
        return ud.bool(forKey: USER_DEFAULTS_KEY_DEBUG)
    }
    
    // put user info
    class func putUserInfo(_ user: User) {
        let ud = UserDefaults.standard
        ud.set(user.getId(), forKey: USER_DEFAULTS_KEY_USER_ID)
        ud.set(user.getName(), forKey: USER_DEFAULTS_KEY_USER_NAME)
        ud.set(user.getScore(), forKey: USER_DEFAULTS_KEY_USER_SCORE)
        ud.set(user.getStage(), forKey: USER_DEFAULTS_KEY_USER_STAGE)
        ud.set(user.getItemlist(), forKey: USER_DEFAULTS_KEY_USER_ITEMLIST)
        ud.set(user.getBacterialist(), forKey: USER_DEFAULTS_KEY_USER_BACTERIALIST)
        ud.set(user.getUpdatedAt(), forKey: USER_DEFAULTS_KEY_USER_UPDATEDAT)
        ud.synchronize()
    }
    
    // get user info
    class func getUserInfo() -> User? {
        let ud = UserDefaults.standard
        let user: User = User()
        user.setId(ud.integer(forKey: USER_DEFAULTS_KEY_USER_ID))
        user.setName(ud.string(forKey: USER_DEFAULTS_KEY_USER_NAME)!)
        user.setScore(ud.integer(forKey: USER_DEFAULTS_KEY_USER_SCORE))
        user.setStage(ud.integer(forKey: USER_DEFAULTS_KEY_USER_STAGE))
        user.setItemlist(ud.array(forKey: USER_DEFAULTS_KEY_USER_ITEMLIST) as! Array<Int>)
        user.setBacterialist(ud.array(forKey: USER_DEFAULTS_KEY_USER_BACTERIALIST) as! Array<Int>)
        user.setUpdatedAt(ud.object(forKey: USER_DEFAULTS_KEY_USER_UPDATEDAT) as! TimeInterval)
        return user
    }
}
