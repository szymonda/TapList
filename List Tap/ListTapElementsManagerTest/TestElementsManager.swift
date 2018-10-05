//
//  TestElementsManager.swift
//  ListTapElementsManagerTest
//
//  Created by Szymon Dawidow on 05.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation
@testable import ListTap

class TestElementsManager: RandomElementsManager {
    func resetElement(index: Int) {
        dataSource.array[index].reset()
    }
    
    func increment(index: Int) {
        dataSource.array[index].increment()
    }
    
    func increment(index: Int, by value:Int ) {
        dataSource.array[index].increment(by: value)
    }
    
    func randomlyFillDatasource() {
        for _ in 0..<maxCount {
            appendRandomElement()
        }
    }
    
    func incrementDatasources(by value: Int) {
        for i in 0..<maxCount {
            increment(index: i, by: value)
        }
    }
}
