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
    
    // OralPieceMap class test
    func testOralPieceMap() {
        
        let map: OralPieceMap = OralPieceMap()
        
        let status: UInt32 = 0x000bff10
        map[3, 3] = PieceStatus(_status: status)
        
        // test1 none
        let t1 = map[0, 0]
        XCTAssertFalse(t1.hasBacteria())
        XCTAssertEqual(0, t1.getHardness())
        XCTAssertEqual(0, t1.getItem())
        XCTAssertEqual(0, t1.getFellow())
        
        // test2 in of range
        let t2 = map[3, 3]
        XCTAssertFalse(t2.hasBacteria())
        XCTAssertEqual(11, t2.getHardness())
        XCTAssertEqual(255, t2.getItem())
        XCTAssertEqual(16, t2.getFellow())
        
        // test3 out of range
        let t3 = map[-1, -1]
        XCTAssertFalse(t3.hasBacteria())
        XCTAssertEqual(0, t3.getHardness())
        XCTAssertEqual(0, t3.getItem())
        XCTAssertEqual(0, t3.getFellow())
    }
    
    func testJsonUtil() {
        
        // test1 get json data and parse
        let url: String = "stagelist"; // change test url
        let util: JsonUtil = JsonUtil()
        let data = util.parseJson(url, type: JSON_FORMAT.FILE)
        
        XCTAssertNotNil(data)
        let obj: NSArray = (data as? NSArray)!
        print(obj)
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
