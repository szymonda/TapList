//
//  TapElement.swift
//  List Tap
//
//  Created by Szymon Dawidow on 03.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

protocol Resetable {
    func reset()
}

protocol Incrementable {
    func increment(by value: Int)
}

class TColor {
    let hex: Int
    let displayRatio: Int
    
    init(hex: Int, displayRatio:Int) {
        self.hex = hex
        self.displayRatio = displayRatio
    }
}

protocol TModel: Incrementable, Resetable {
    var number: Int {get set}
}

class TElement: TModel {
    let color: TColor
    var number: Int
    var displayedValue: Int {
        return number * color.displayRatio
    }
    init(color: TColor, number: Int) {
        self.color = color
        self.number = number
    }
    
    func increment(by value: Int = 0) {
        number += value
    }
    
    func reset() {
        number = 0
    }
}


