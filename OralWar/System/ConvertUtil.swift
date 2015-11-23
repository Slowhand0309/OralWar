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
let STAGE_DATA: String = "stage_data"

// declare key for bacteria
let ID: String = "id"
let RATE: String = "rate"
let CYCLE: String = "cycle"

// declare key for stagelist
let NAME: String = "name"
let URI: String = "uri"
let IMG_URI: String = "img_uri"

class ConvertUtil {
    
    // convert json -> OralPieceMap
    class func toOralPieceMap(jsonData: NSDictionary?) -> OralPieceMap? {
        
        guard let data: NSDictionary = jsonData else {
            return nil
        }
        // get stage no
        guard let stageNo: Int = data[STAGE_NO] as? Int else {
            return nil
        }
        // get stage name
        guard let stageName: String = data[STAGE_NAME] as? String else {
            return nil
        }
        // get stage data
        guard let stageData: NSArray = data[STAGE_DATA] as? NSArray else {
            return nil
        }
        
        let stageMap: OralPieceMap = OralPieceMap()
        stageMap.setNo(stageNo)
        stageMap.setName(stageName)
        
        for var h = 0; h < HEIGHT; h++ {
            for var w = 0; w < WIDTH; w++ {
                var t: Int = stageData[h * HEIGHT + w] as! Int
                let value: UInt32 = UInt32(t)
                stageMap[w, h] = PieceStatus(_status: value)
            }
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
    class func toStage(jsonData: NSDictionary?) -> Stage? {
        
        guard let data: NSDictionary = jsonData else {
            return nil
        }
        // get id
        guard let id: Int = data[ID] as? Int else {
            return nil
        }
        // get name
        guard let name: String = data[NAME] as! String! else {
            return nil
        }
        // get uri
        guard let uri: String = data[URI] as! String! else {
            return nil
        }
        
        // get image uri
        guard let img: String = data[IMG_URI] as! String! else {
            return nil
        }
        
        let stage: Stage = Stage()
        stage.setId(id)
        stage.setName(name)
        stage.setUri(uri)
        stage.setImageUri(img)
        
        return stage
    }
}