//
//  Array+Extension.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation




extension Array {
    func randomIndex() -> Int {
        return Int.random(0..<self.count)
    }
    
    func randomElement() -> Element {
        return self[randomIndex()]
    }
}
