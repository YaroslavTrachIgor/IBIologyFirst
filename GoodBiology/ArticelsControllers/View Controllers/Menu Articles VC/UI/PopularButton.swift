//
//  PopularButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticelsViewControllerProtocol {
    func articelsViewControllerTextViewSetup()
    func setupNavController()
}

protocol PopularButtonProtocol {
    func setupButton()
}

class PopularButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension PopularButton: PopularButtonProtocol {
    func setupButton() {
        setupCornerRadius()
        setupTitleLabel()
        setupShadow()
        setupBack()
    }
}

extension PopularButton {
    func setupTitleLabel() {
        titleLabel?.textColor = .biologyGreenColor
        
        let font = UIFont(name: BasicFonts.mediumFont, size: 14)
        titleLabel?.font = font
    }
    
    func setupShadow() {
        buttonsShadows()
        
        layer.shadowColor = UIColor.systemGray5.cgColor
    }
    
    func setupCornerRadius() {
        layer.cornerRadius = 15
    }
    
    func setupBack() {
        alpha = 0
        
        backgroundColor = .systemBackground
    }
}
