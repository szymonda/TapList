//
//  ListTapElementsManagerTest.swift
//  ListTapElementsManagerTest
//
//  Created by Szymon Dawidow on 05.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import XCTest
@testable import ListTap

class ListTapElementsManagerTest: XCTestCase {
    
    var manager: TestElementsManager!
    
    override func setUp() {
        super.setUp()
        manager = TestElementsManager(dataSource: GenericDataSource<TElement>(), maxCount: 5)
    }
    
    override func tearDown() {
         manager = nil
        super.tearDown()
    }
    
    
    func testModifyTappedElement() {
        let value = 3
        let tappedIndex = 2
        let promise = value + (value % manager.maxCount)
        
        manager.randomlyFillDatasource()
        manager.incrementDatasources(by: value)
        XCTAssertEqual(manager.dataSource.array[tappedIndex].number, 3)
        
        manager.modifyTappedElement(index: tappedIndex)
        XCTAssertEqual(manager.dataSource.array[tappedIndex].number, promise)
    }
    
    func testAppendRandomElement() {
        let rangeMax = 5
        for _ in 0..<rangeMax {
            manager.appendRandomElement()
        }
        XCTAssertEqual(manager.dataSource.dataCount, rangeMax, "Invalid count of objects")
    }
    
    func testTick() {
        let tickCount = 5
        for _ in 0..<tickCount {
            manager.updateElements()
            XCTAssertTrue(manager.dataSource.dataCount <= manager.maxCount)
        }
    }
    
}
