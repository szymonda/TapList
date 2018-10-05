//
//  TapListDataSource.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//


import UIKit.UICollectionView

private let cellId = "Cell"
class TapListDataSource: GenericDataSource<TElement> ,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TapListCollectionViewCell
        let element = array[indexPath.row]
        cell.configure(value: element.displayedValue, color: element.color.hex)
        return cell
    }
}
