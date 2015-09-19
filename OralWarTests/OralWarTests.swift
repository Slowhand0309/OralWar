//
//  OralWarTests.swift
//  OralWarTests
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import UIKit
import XCTest

class OralWarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // PieceStatus class test
    func testPieceStatus() {
        
        // test1 hasBacteria
        let status: UInt32 = 0x01050aff
        let p1: PieceStatus = PieceStatus(_status: status)
        XCTAssertTrue(p1.hasBacteria())
        
        // test2 getHardness
        XCTAssertEqual(5, p1.getHardness())
        
        // test3 getItem
        XCTAssertEqual(10, p1.getItem())
        
        // test4 getFellow
        XCTAssertEqual(255, p1.getFellow())
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
