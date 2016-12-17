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
        describe("Check property", {
            
            it("zero propertys", closure: {
                let ps = PieceStatus(_status: 0)
                
                expect(ps.hasBacteria()).to(beFalse())
                expect(ps.getHardness()).to(equal(0))
                expect(ps.getItem()).to(equal(0))
                expect(ps.getFellow()).to(equal(0))
            })
            
            it("should be has status", closure: {
                
                let status: UInt32 = 0x01050aff
                let p1: PieceStatus = PieceStatus(_status: status)
                
                expect(p1.hasBacteria()).to(beTrue())
                expect(p1.getHardness()).to(equal(5))
                expect(p1.getItem()).to(equal(10))
                expect(p1.getFellow()).to(equal(255))
            })
        })
    }
}
