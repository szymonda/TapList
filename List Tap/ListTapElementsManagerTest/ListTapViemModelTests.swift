//
//  ListTapViemModelTests.swift
//  ListTapViemModelTests
//
//  Created by Szymon Dawidow on 05.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import XCTest
@testable import ListTap

class ListTapViemModelTests: XCTestCase {
    
    var viewModel: TapListViewModel!
    var dataSource:GenericDataSource<TElement>!
    var manager: TestElementsManager!
    
    override func setUp() {
        super.setUp()
        dataSource = GenericDataSource<TElement>()
        manager = TestElementsManager(dataSource: dataSource)
        viewModel = TapListViewModel(dataSource: dataSource, elementsManager: manager)
        
    }
    
    override func tearDown() {
        dataSource = nil
        manager = nil
        viewModel = nil
        super.tearDown()
    }
    

    func testTimer() {
        viewModel.toggleTimer()
        XCTAssertTrue(viewModel.timerStarted)
        viewModel.toggleTimer()
        XCTAssertFalse(viewModel.timerStarted)
    }
}

