//
//  HideButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 20.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol HideButtonProtocol {
    func setupButton()
}

final class HideButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension HideButton: HideButtonProtocol {
    func setupButton() {
        if #available(iOS 13.0, *) {
            let appleButton = AppleButtonSettings()
            
            backgroundColor = appleButton.backgroundColor
        }
        let titleColor  = UIColor.biologyGreenColor

        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 12
        titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
    }
}
