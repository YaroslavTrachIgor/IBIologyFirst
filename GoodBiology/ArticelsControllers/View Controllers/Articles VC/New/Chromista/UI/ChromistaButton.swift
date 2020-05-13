//
//  ChromistaButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Buttons (size, hide functions)
final class ChromistaButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
}

extension ChromistaButton: ChromistaButtonDelegate {
    func setupButton() {
        setupTint()
        setupCorners()
    }
}

extension ChromistaButton {
    func setupTint() {
        tintColor = .biologyGreenColor
    }
    
    func setupCorners() {
        layer.cornerRadius = 16
    }
}

protocol ChromistaButtonDelegate {
    func setupButton()
}
