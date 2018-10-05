//
//  TapListCollectionViewCell.swift
//  List Tap
//
//  Created by Szymon Dawidow on 02.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit

class TapListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        colorView.layer.cornerRadius = colorView.bounds.size.height / 2
        colorView.clipsToBounds = true
    }
    
    func configure(value: Int, color: Int) {
        valueLabel.text = "\(value)"
        colorView.backgroundColor = UIColor(rgb: color)
    }
    
}
