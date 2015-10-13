//
//  ConvertUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/08.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation

// declare key
let STAGE_NO: String = "stage_no"
let STAGE_NAME: String = "stage_name"

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
}