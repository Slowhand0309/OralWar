//
//  OralPieceMap.swift
//  OralWar
//
//  Created by MrSmall on 2015/09/08.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import Foundation

// TODO provisional value
let WIDTH: Int = 32
let HEIGHT: Int = 32

// Oral map
class OralPieceMap {
    
    var pieces: [PieceStatus]
    
    init() {
        pieces = Array(count: WIDTH * HEIGHT,
            repeatedValue: PieceStatus(_status: 0))
    }
    
    // value obtained in [w, h]
    subscript (width :Int, height :Int) -> PieceStatus {
        get {
            if isRange(width, h: height) {
                return pieces[height * HEIGHT + width]
            }
            return PieceStatus(_status: 0)
        }
        set {
            if isRange(width, h: height) {
                pieces[height * HEIGHT + width] = newValue
            }
        }
    }
    
    // range check
    func isRange(w :Int, h :Int) -> Bool {
        if w < 0 || w > WIDTH
            || h < 0 || h > HEIGHT {
                return false
        }
        return true
    }
}