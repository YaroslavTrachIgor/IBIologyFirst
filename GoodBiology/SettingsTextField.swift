//
//  SettingsTextField.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 05.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol SettingsTextFieldProtocol {
    func setupField()
}

class SettingsTextField: UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupField()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupField()
    }
}

extension SettingsTextField: SettingsTextFieldProtocol {
    func setupField() {
        settingsTextFieldPrefering()
    }
}

extension UITextField {
    func settingsTextFieldPrefering() {
        let size: CGFloat    = 17
        let fontName: String = "AvenirNext-Medium"
        
        self.font = UIFont(name: fontName, size: size)
    }
}
