//
//  TextureUtil.swift
//  OralWar
//
//  Created by MrSmall on 2015/10/22.
//  Copyright © 2015年 MrSmall. All rights reserved.
//

import Foundation
import SpriteKit

class TextureUtil {
    
    // load divid image file
    class func loadDivImage(imgName: String, col: Int, row: Int) -> Array<SKTexture> {
        
        let srcTexture: SKTexture = SKTexture(imageNamed: imgName)
        
        let width = srcTexture.size().width
        let height = srcTexture.size().height
        
        let w = (width / CGFloat(col)) / width
        let h = (height / CGFloat(row)) / height
        
        var array: Array<SKTexture> = Array<SKTexture>()
        
        for (var i = 0; i < col; i++) {
            for (var j = 0; j < row; j++) {
                let x = CGFloat(i) * w
                let y = CGFloat(j) * h
                let texture: SKTexture = SKTexture(rect: CGRectMake(x, y, w, h), inTexture: srcTexture)
                array.append(texture)
            }
        }
        return array
    }
}