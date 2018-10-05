//
//  UIView+Extension.swift
//  List Tap
//
//  Created by Szymon Dawidow on 03.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint  = startPoint
        gradientLayer.endPoint = endPoint
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
