//
//  ControlButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 11.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ReadingOnTimeViewControllerControllButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    
    private func setupButton() {
        if #available(iOS 13.0, *) {
            let appleButton = AppleButtonSettings()
            
            titleLabel?.font = appleButton.font
            backgroundColor = appleButton.backgroundColor
        }
        
        buttonsShadows()
        layer.shadowColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        if #available(iOS 13.0, *) {
            layer.shadowRadius = ReadingOnTimeStyleVaribles.shadowRadius
            setTitleColor(ReadingOnTimeStyleVaribles.textColor, for: .normal)
        }
        layer.cornerRadius = 10
    }
}
