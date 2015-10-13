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

// declare json parse from format
enum JSON_FORMAT {
    case URL
    case FILE
}

// class json utility
class JsonUtil {
    
    init () {
        
    }
    
    // parse json function
    func parseJson(uri: String, type: JSON_FORMAT) -> AnyObject? {
        
        var data: NSData?
        switch type {
          case .URL:
            data = getJsonDataFromUrl(uri)
            break
          case .FILE:
            data = getJsonDataFromResource(uri)
            break
        }
        
        if let dataJson = data as NSData? {
          return parse(dataJson)
        }
        return nil
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
        
        if let nsurl = NSURL(string: url) as NSURL? {
            var enc: NSStringEncoding = NSUTF8StringEncoding
            do {
                let str = try NSString(contentsOfURL: nsurl, usedEncoding:&enc)
                return str.dataUsingEncoding(enc)!
            } catch _ as NSError {
                return NSData()
            }
        }
        return NSData()
    }
    
    // parse json data
    func parse(data: NSData) -> AnyObject? {
        
        var jsonData: AnyObject?
        do {
            jsonData = try (NSJSONSerialization.JSONObjectWithData(
                data, options: NSJSONReadingOptions.AllowFragments) )
        } catch  {
        }
        return jsonData
    }
}