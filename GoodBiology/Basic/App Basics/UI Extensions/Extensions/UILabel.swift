//
//  UILabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.08.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Adress Label Setup
public extension UILabel {
    func adressLabelPrefering() {
        layer.cornerRadius = 1.7
        layer.borderColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        layer.borderWidth = 2.5
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textColor = .biologyGreenColor
        text = ""
        labelShadow()
    }
}
