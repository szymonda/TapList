//
//  TElementsManager.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

protocol TElementsManager {
    var dataSource:GenericDataSource<TElement> {get}
    func modifyTappedElement(index: Int)
    func updateElements()
}

class RandomElementsManager: TElementsManager {

    let dataSource:GenericDataSource<TElement>
    
    var maxCount: Int = 5
   
    init(dataSource: GenericDataSource<TElement>, maxCount: Int) {
        self.dataSource = dataSource
        self.maxCount = maxCount
    }
    
    init(dataSource: GenericDataSource<TElement>) {
        self.dataSource = dataSource
    }
    
    func updateElements() {
        if dataSource.dataCount < maxCount {
            appendRandomElement()
        }
        else{
            let index = dataSource.array.randomIndex()
            randomTick(index: index)
        }
    }
    
    func modifyTappedElement(index: Int) {
        baseElementModification(index: index)
    }
    
    func appendRandomElement() {
        let randColor = App.colors.randomElement()
        dataSource.array.append(TElement(color: randColor, number: 0))
    }
    
    private func randomTick(index: Int) {
        
        let element = dataSource.array[index]
        
        switch Int.random(1..<100) {
            
        case 1...50:
            element.increment(by: 1)
        case 51...80:
            element.reset()
        case 81...90:
            dataSource.array.remove(at: index)
        case 91...100:
            baseElementModification(index: index)
        default:
            fatalError()
        }
    }
    
    private func calculateIndex(_ index: Int, withAdvance advance: Int) -> Int? {
        let calcIndex = index + advance
        guard 0...dataSource.dataCount ~= calcIndex else { return nil }
        
        return calcIndex
    }
    
    private func moduloIncrementElement(index: Int, withValueOfIndex valIndex: Int) {
      
        let currentElement = dataSource.array[index]
        let value = dataSource.array[valIndex].number
        
        let moduloValue = value % dataSource.dataCount
        currentElement.increment(by: moduloValue)
    }
    
    private func baseElementModification(index: Int) {
        if let advIndex = calculateIndex(index, withAdvance: -1) {
            moduloIncrementElement(index: index, withValueOfIndex: advIndex)
        }
    }
}
