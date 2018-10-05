//
//  SynchronizedArray.swift
//  ListTap
//
//  Created by Szymon Dawidow on 05.10.2018.


import Foundation

public class SynchronizedArray<T> {
    private var array: [T] = []
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    func append(_ newElement: T) {
        self.accessQueue.async(flags:.barrier) {
            self.array.append(newElement)
        }
    }
    
    func remove(at index: Int) {
        self.accessQueue.async(flags:.barrier) {
            self.array.remove(at: index)
        }
    }
    
    var count: Int {
        var count = 0
        
        self.accessQueue.sync {
            count = self.array.count
        }
        return count
    }
    
    func first() -> T? {
        var element: T?
        
        self.accessQueue.sync {
            if !self.array.isEmpty {
                element = self.array[0]
            }
        }
        return element
    }
    
    subscript(index: Int) -> T {
        set {
            self.accessQueue.async(flags:.barrier) {
                self.array[index] = newValue
            }
        }
        get {
            var element: T!
            self.accessQueue.sync {
                element = self.array[index]
            }
            return element
        }
    }
    
    func randomIndex() -> Int {
        return Int.random(0..<self.count)
    }
    
    func randomElement() -> T {
        return self[randomIndex()]
    }
}
