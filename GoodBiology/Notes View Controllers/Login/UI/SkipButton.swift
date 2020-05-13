//
//  SkipButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol SkipButtonProtocol {
    func setupButton()
}

class SkipButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension SkipButton: SkipButtonProtocol {
    func setupButton() {
        setupShadow()
    }
}

extension SkipButton {
    private func setupShadow() {
        viewShadows()
        
        layer.shadowColor  = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        layer.shadowRadius = 0.6
        layer.shadowOffset = CGSize.zero
    }
}
