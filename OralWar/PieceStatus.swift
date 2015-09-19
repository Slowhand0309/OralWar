//
//  PieceStatus.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/31.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import Foundation

public class PieceStatus {

    // status 32bit |     1byte    |     2byte    |     3byte     |      4byte    |
    //              |Being bacteria|   Hardness   |     Item      |     Fellow    |
    private var status: UInt32
    
    // initialize
    public init (_status: UInt32) {
      status = _status
    }
    
    // get being bacteria
    internal func hasBacteria() -> Bool {
      let tmp = (status & 0xff000000) >> 24
      return tmp == 1
    }
    
    // get tooth hardness
    internal func getHardness() -> UInt32 {
      let tmp = (status & 0x00ff0000) >> 16
      return tmp
    }
    
    // get item
    internal func getItem() -> UInt32 {
      let tmp = (status & 0x0000ff00) >> 8
      return tmp
    }
    
    // get fellow bacteria
    internal func getFellow() -> UInt32 {
      let tmp = (status & 0x000000ff)
      return tmp
    }
}
