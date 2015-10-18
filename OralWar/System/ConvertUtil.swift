//
//  ConvertUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/08.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// declare key for stage
let STAGE_NO: String = "stage_no"
let STAGE_NAME: String = "stage_name"

// declare key for bacteria
let ID: String = "id"
let RATE: String = "rate"
let CYCLE: String = "cycle"

let URI: String = "uri"

class ConvertUtil {
    
    // convert json -> OralPieceMap
    class func toOralPieceMap(jsonData: NSDictionary?) -> OralPieceMap? {
        
        var no: Int
        var name: String
        let stageMap: OralPieceMap = OralPieceMap()
        
        guard let data: NSDictionary = jsonData else {
            return nil
        }
        
        if let stageNo: Int = data[STAGE_NO] as? Int {
            no = stageNo
        }
        
        if let stageName: String = data[STAGE_NAME] as? String {
            name = stageName
        }
        return stageMap
    }
    
    // convert json data -> Bacteria
    class func toBacteria(jsonData: NSDictionary?) -> Bacteria? {
        guard let data: NSDictionary = jsonData else {
            return nil
        }
        // get id
        guard let id: Int = data[ID] as? Int else {
            return nil
        }
        // get rate
        guard let rate: Float = data[RATE] as? Float else {
            return nil
        }
        // get cycle
        guard let cycle: Int = data[CYCLE] as? Int else {
            return nil
        }
        // TODO animType, expandType
        
        let bacteria: Bacteria = Bacteria()
        bacteria.setId(id)
        bacteria.setRate(rate)
        bacteria.setCycle(cycle)
        
        return bacteria
    }
    
    // convert json data -> Item
    class func toItem(jsonData: NSDictionary?) -> Item? {
        guard let data: NSDictionary = jsonData else {
            return nil
        }
        // get id
        guard let id: Int = data[ID] as? Int else {
            return nil
        }
        // get name
        guard let name: String = data[ID] as? String else {
            return nil
        }
        
        let item: Item = Item()
        item.setId(id)
        item.setName(name)
        return item
    }
    
    // get stage uri
    class func getStageUri(jsonData: NSDictionary?) -> String {
        
        guard let data: NSDictionary = jsonData else {
            return ""
        }
        guard let uri: String = data[URI] as! String! else {
            return ""
        }
        return uri
    }
}