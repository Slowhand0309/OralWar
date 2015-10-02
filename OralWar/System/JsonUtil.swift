//
//  JsonUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/09/30.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

let TYPE: String = "json"

// extension : add isEmpty func
extension NSData {
    
    func isEmpty() -> Bool {
        return self.length == 0
    }
}

class JsonUtil {
    
    var jsonData: NSDictionary!
    
    init () {
        
    }
    
    // get json data from resource
    func getJsonDataFromResource(fileName: String) -> NSData {
        
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: TYPE) else {
            return NSData()
        }
        guard let fileHandle: NSFileHandle = NSFileHandle(forReadingAtPath: path) else {
            return NSData()
        }
        return fileHandle.readDataToEndOfFile()
    }
    
    // get json data from url
    func getJsonDataFromUrl(url: String) -> NSData {
        
        let _url = NSURL(string: url)
        print(_url)
        return NSData()
    }
    
    // parse json data
    func parse(data: NSData) -> Bool {
        
        do {
            jsonData = try NSJSONSerialization.JSONObjectWithData(
                data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
        } catch  {
            return false
        }
        return true
    }
}