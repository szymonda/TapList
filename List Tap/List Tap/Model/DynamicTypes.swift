//
//  Dynamic.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

class DynamicValue<T> {
    
    var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: () -> Void]()
    
    init(_ value: T) {
        self.value = value
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    public func add(observer: NSObject, completion: @escaping () -> Void) {
        observers[observer.description] = completion
    }
    
    public func addAndNotify(observer: NSObject, completion: @escaping () -> Void) {
        self.add(observer: observer, completion: completion)
        self.notify()
    }
    
    deinit {
        observers.removeAll()
    }
}
