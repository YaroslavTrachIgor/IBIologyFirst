//
//  ControlButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 11.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

final class ReadingOnTimeViewControllerControllButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension ReadingOnTimeViewControllerControllButton {
    private func setupButton() {
        
        /// set font
        let basicProperties = AppleButtonSettings()
        titleLabel?.font = basicProperties.font
        
        /// setup border
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.9
        
        /// set background Color
        backgroundColor = .clear
        
        /// set Title Color
        setTitleColor(.white, for: .normal)
        
        /// Set font
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        
        /// Set corner Radius
        layer.cornerRadius = 15
    }
}
