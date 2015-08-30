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
      var tmp = (status & 0xff000000) >> 28
      return tmp == 1
    }
}
