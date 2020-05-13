//
//  LastSaveDateLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

// MARK: - LastSaveDateLabelProtocol protocol
protocol LastSaveDateLabelProtocol {
    func setupLabel()
}

class LastSaveDateLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}



// MARK: - LastSaveDateLabelProtocol
extension LastSaveDateLabel: LastSaveDateLabelProtocol {
    func setupLabel() {
        setupFont()
        setupTextColor()
        setupShadow()
        setupAlpha()
    }
}



// MARK: - Main Functions
extension LastSaveDateLabel {
    private func setupFont() {
        font = UIFont(name: BasicFonts.mediumFont, size: 15)
    }
    
    private func setupTextColor() {
        textColor = #colorLiteral(red: 0.2265492365, green: 0.2452898091, blue: 0.272515206, alpha: 1)
    }
    
    private func setupShadow() {
        labelShadow()
        
        layer.shadowRadius = 1
        layer.shadowColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOffset = CGSize(width: 0.5, height: 1)
    }
    
    private func setupAlpha() {
        alpha = 0
    }
}
