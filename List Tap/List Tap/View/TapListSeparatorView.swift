//
//  ListDecorationView.swift
//  List Tap
//
//  Created by Szymon Dawidow on 01.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit
import QuartzCore

class TapListSeparatorView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradientBackground(colorOne: UIColor.AppColor.gradientGray, colorTwo: .white, startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        self.frame = layoutAttributes.frame
    }
}
