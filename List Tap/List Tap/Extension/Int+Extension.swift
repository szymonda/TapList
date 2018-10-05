//
//  Int+Extension.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

extension Int {
    static func random(_ range:Range<Int>) -> Int {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }
    
    static func random(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max + 1)))
    }
}
