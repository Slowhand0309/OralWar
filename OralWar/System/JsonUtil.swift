//
//  JsonUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/09/30.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

let TYPE: String = "json"
let ORAL_SCHEME_FILE: String = "oral://file/"

// extension : add isEmpty func
extension Data {
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
}

// declare json parse from format
enum JSON_FORMAT {
    case url
    case file
}

// class json utility
class JsonUtil {
    
    init () {
        
    }
    
    // parse json by uri scheme function
    func parseJson(_ uri: String) -> Any? {
        if uri.hasPrefix(ORAL_SCHEME_FILE) {
            // FILE
            // remove schene
            let fileUri: String = uri.replacingOccurrences(of: ORAL_SCHEME_FILE, with: "")
            return parseJson(fileUri, type: JSON_FORMAT.file)
        } else {
            // URL
            return parseJson(uri, type: JSON_FORMAT.url)
        }
    }
    
    // parse json function
    func parseJson(_ uri: String, type: JSON_FORMAT) -> Any? {
        
        var data: Data?
        switch type {
          case .url:
            data = getJsonDataFromUrl(uri)
            break
          case .file:
            data = getJsonDataFromResource(uri)
            break
        }
        
        if let dataJson = data as Data? {
          return parse(dataJson)
        }
        return nil
    }
    
    // get json data from resource
    func getJsonDataFromResource(_ fileName: String) -> Data {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: TYPE) else {
            return Data()
        }
        guard let fileHandle: FileHandle = FileHandle(forReadingAtPath: path) else {
            return Data()
        }
        return fileHandle.readDataToEndOfFile()
    }
    
    // get json data from url
    func getJsonDataFromUrl(_ url: String) -> Data {
        
        if let nsurl = URL(string: url) as URL? {
            var enc: String.Encoding = String.Encoding.utf8
            do {
                let str = try NSString(contentsOf: nsurl, usedEncoding:&enc.rawValue)
                return str.data(using: enc.rawValue)!
            } catch _ as NSError {
                return Data()
            }
        }
        return Data()
    }
    
    // parse json data
    func parse(_ data: Data) -> Any? {
        
        var jsonData: Any?
        do {
            jsonData = try (JSONSerialization.jsonObject(
                with: data, options: JSONSerialization.ReadingOptions.allowFragments) )
        } catch  {
            // return nil
        }
        return jsonData
    }
}
