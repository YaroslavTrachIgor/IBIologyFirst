//
//  Button.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - TestButtonDelegate Protocol
protocol TestButtonDelegate {
    func setup()
}

class TestButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}



//MARK: - TestButtonDelegate
extension TestButton: TestButtonDelegate {
    func setup() {
        setupTitle()
        setupCorners()
        setupBorders()
        setupBackground()
        setupShadow()
    }
}



//MARK: - Main Functions
extension TestButton {
    private func setupTitle() {
        setTitleColor(.biologyGreenColor, for: .normal)
        titleLabel?.font = UIFont(name: BasicFonts.boldFont, size: 13.3)
    }
    
    private func setupCorners() {
        layer.cornerRadius = 15
    }
    
    private func setupBorders() {
        layer.borderColor = UIColor.biologyGreenColor.cgColor
        layer.borderWidth = 2.7
    }
    
    private func setupBackground() {
        backgroundColor =  .systemBackground
    }
    
    private func setupShadow() {
        testButtonsShadows()
    }
}
