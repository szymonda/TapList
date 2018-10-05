//
//  GenericDataSource.swift
//  ListTap
//
//  Created by Szymon Dawidow on 05.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<SynchronizedArray<T>> = DynamicValue(SynchronizedArray())
    var dataCount: Int {
        get {
            return data.value.count
        }
    }
    var array: SynchronizedArray<T> {
        get {
            return data.value
        }
        
        set {
            data.value = newValue
        }
    }
}
