//
//  TapListViewModel.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import Foundation

class TapListViewModel {
    
    init(dataSource: GenericDataSource<TElement>, elementsManager: TElementsManager) {
        self.dataSource = dataSource
        self.elementsManager = elementsManager
    }
    
    var elementsManager: TElementsManager
    
    var dataSource: GenericDataSource<TElement>
    
    private var timer = Timer()
    
    var timerStarted: Bool = false {
        didSet {
            updateTimerStatus?(timerStarted)
            setTimer()
        }
    }
    
    var elementsCount: Int {
        get {
            return dataSource.dataCount
        }
    }
    
    var updateTimerStatus: ((Bool)->())?
    
    var dataModelUpdate: (()->())?
    
    func toggleTimer() {
        timerStarted = !timerStarted
    }

    func setTimer() {
        if timerStarted {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        }
        else {
            timer.invalidate()
        }
    }
    
    func element(indexPath: IndexPath) -> TElement{
        return dataSource.array[indexPath.row]
    }
    
    func userTappedAt(indexPath: IndexPath) {
        elementsManager.modifyTappedElement(index: indexPath.row)
    }
    
    @objc func timerTick() {
        elementsManager.updateElements()
        dataModelUpdate?()
    }
}
