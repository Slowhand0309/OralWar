//
//  PieceStatusSpec.swift
//  OralWar
//
//  Created by MrSmall on 2016/12/17.
//  Copyright © 2016年 MrSmall. All rights reserved.
//

import Quick
import Nimble

class PieceStatusSpec: QuickSpec {
    
    override func spec() {
        describe("Test status", {
            
            it("should be has status", closure: {
                
                let status: UInt32 = 0x01050aff
                let p1: PieceStatus = PieceStatus(_status: status)
                
                expect(p1.hasBacteria()).to(beTrue())
                expect(p1.getHardness()).to(be(5))
                expect(p1.getItem()).to(be(10))
                expect(p1.getFellow()).to(be(255))
            })
        })
    }
}
