//
//  OrakPieceMapSpec.swift
//  OralWar
//
//  Created by MrSmall on 2016/12/17.
//  Copyright © 2016年 MrSmall. All rights reserved.
//

import Quick
import Nimble

class OralPieceMapSpec: QuickSpec {
    
    override func spec() {
        describe("Check property", {
            
            it("init propertys", closure: {
                let map = OralPieceMap()
                
                let p1 = map[0, 0]
                expect(p1.hasBacteria()).to(beFalse())
                expect(p1.getHardness()).to(equal(0))
                expect(p1.getItem()).to(equal(0))
                expect(p1.getFellow()).to(equal(0))
                
                let p2 = map[31, 31]
                expect(p2.hasBacteria()).to(beFalse())
                expect(p2.getHardness()).to(equal(0))
                expect(p2.getItem()).to(equal(0))
                expect(p2.getFellow()).to(equal(0))
            })
            
            it("set piece status", closure: {
                
                let status: UInt32 = 0x01050aff
                let ps: PieceStatus = PieceStatus(_status: status)
                
                let map = OralPieceMap()
                map[3, 10] = ps
                
                expect(map[3, 10].hasBacteria()).to(beTrue())
                expect(map[3, 10].getHardness()).to(equal(5))
                expect(map[3, 10].getItem()).to(equal(10))
                expect(map[3, 10].getFellow()).to(equal(255))
            })
            
            it("out of range", closure: {
                let map = OralPieceMap()
                let ps = map[-1, -1]
                
                expect(ps.hasBacteria()).to(beFalse())
                expect(ps.getHardness()).to(equal(0))
                expect(ps.getItem()).to(equal(0))
                expect(ps.getFellow()).to(equal(0))
            })
        })
    }
}
