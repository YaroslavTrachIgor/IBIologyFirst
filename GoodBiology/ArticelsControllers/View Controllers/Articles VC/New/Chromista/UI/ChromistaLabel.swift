//
//  ChromistaLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Labels - Headers of(Little Descriptions) Articles
protocol ChromistaLabelDelegate {
    func setupChromistaLabel()
}

final class ChromistaLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupChromistaLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupChromistaLabel()
    }
}

extension ChromistaLabel: ChromistaLabelDelegate {
    func setupChromistaLabel() {
        setupTextColor()
        setupAlpha()
        setupShadow()
    }
}

extension ChromistaLabel {
    func setupTextColor() {
        if #available(iOS 13.0, *) {
            textColor = .secondaryLabel
        }
    }
    
    func setupAlpha() {
        alpha = 0
    }
    
    func setupShadow() {
        labelShadow()
    }
}
