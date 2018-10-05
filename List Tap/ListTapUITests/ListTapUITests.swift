//
//  ListTapUITests.swift
//  ListTapUITests
//
//  Created by Szymon Dawidow on 05.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import XCTest

class ListTapUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()
        
        app = XCUIApplication()

    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testStartButton() {
        
        let startButton = app.buttons["START"]
        let stopButton = app.buttons["STOP"]
        
            XCTAssertTrue(startButton.exists)
            startButton.tap()
            XCTAssertTrue(stopButton.exists)
            stopButton.tap()
            XCTAssertTrue(startButton.exists)
    }
}
