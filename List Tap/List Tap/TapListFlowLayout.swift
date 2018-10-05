//
//  ListLayout.swift
//  List Tap
//
//  Created by Szymon Dawidow on 01.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit

class TapListFlowLayout: UICollectionViewFlowLayout {
    
    private let separatorKind = "separator"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.register(TapListSeparatorView.self, forDecorationViewOfKind: separatorKind)
        self.scrollDirection = .vertical
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == separatorKind {
            let attributes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: separatorKind, with: indexPath)
            let yOffSet = (indexPath.row + 1) * Int(self.itemSize.height) + (indexPath.row * Int(self.minimumLineSpacing))
            attributes.frame = CGRect(x: 0, y: yOffSet, width: Int(self.collectionViewContentSize.width), height: Int(minimumLineSpacing))
            attributes.zIndex = 1000
            return attributes
        }
        return nil
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect) ?? []
        let lineWidth = self.minimumLineSpacing
        
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        
        for layoutAttribute in layoutAttributes where layoutAttribute.indexPath.item > 0 {
            let separatorAttribute = UICollectionViewLayoutAttributes(forDecorationViewOfKind: separatorKind,
                                                                      with: layoutAttribute.indexPath)
            let cellFrame = layoutAttribute.frame
            separatorAttribute.frame = CGRect(x: cellFrame.origin.x,
                                              y: cellFrame.origin.y - lineWidth,
                                              width: cellFrame.size.width,
                                              height: lineWidth)
            separatorAttribute.zIndex = Int.max
            decorationAttributes.append(separatorAttribute)
        }
        
        return layoutAttributes + decorationAttributes
    }

    func indexPathsOfSeparators(in rect: CGRect) -> [IndexPath] {
        guard rect.origin.y >= -rect.size.height/2 else {return []}
        
        let firstIndex = Int(floor(rect.origin.y/self.itemSize.height))
        let lastIndex = Int(floor((rect.origin.y + rect.height) / self.itemSize.height))
        guard let itemsCount = self.collectionView?.dataSource?.collectionView(self.collectionView!, numberOfItemsInSection: 0) else {return []}
        
        var indexPaths = [IndexPath]()
        let startIndex:Int = max(firstIndex, 0)
        for i in startIndex..<lastIndex {
            if i < itemsCount {
                indexPaths.append(IndexPath(row: i, section: 0))
            }
        }
        return indexPaths
    }
}
