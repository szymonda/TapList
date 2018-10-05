//
//  UIColor+Extension.swift
//  List Tap
//
//  Created by Szymon Dawidow on 02.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct AppColor {
        
        static let red = UIColor(rgb: App.redHex)
        static let blue = UIColor(rgb: App.blueHex)
        static let green = UIColor(rgb: App.greenHex)
        static let gradientGray = UIColor(rgb: 0xD0D2D4)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert((0...255 ~= red), "Invalid red component")
        assert((0...255 ~= green), "Invalid green component")
        assert((0...255 ~= blue), "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb>>16) & 0xFF, green: (rgb>>8) & 0xff, blue: (rgb) & 0xff)
    }
}
