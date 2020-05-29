//
//  HelpButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 05.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - TextViewBackViewProtocol protocol
protocol HelpButtonDelegate {
    func setup()
}



//MARK: - HelpButton main class
final class HelpButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}



//MARK: - TextViewBackViewProtocol extension
extension HelpButton: HelpButtonDelegate {
    func setup() {
        
        /// Setup Hidden
        isHidden = true
        
        /// Setup Borders
        layer.borderColor  = #colorLiteral(red: 0.03711384535, green: 0.3201311529, blue: 0.1156642511, alpha: 1)
        layer.borderWidth  = 2.7
        
        /// Setup Corners
        layer.cornerRadius = 14
        
        /// Setup backgroundColor
        backgroundColor = #colorLiteral(red: 0.03295460343, green: 0.3801311255, blue: 0.1365214586, alpha: 1)
    }
}
