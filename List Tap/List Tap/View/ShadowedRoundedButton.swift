//
//  ShadowedRoundedButton.swift
//  List Tap
//
//  Created by Szymon Dawidow on 03.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit

class ShadowedRoundedButton: UIButton {
    
    var shadowLayer: CAShapeLayer!
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(radius: 4)
        self.backgroundColor = UIColor.AppColor.green
        self.dropShadow()
    }
    
    func dropShadow() {
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 4).cgPath
            shadowLayer.fillColor = self.backgroundColor?.cgColor
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.5
            shadowLayer.shadowRadius = 2
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIButton.animate(withDuration: 0.2,animations: {
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.95)
        })
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIButton.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
}
