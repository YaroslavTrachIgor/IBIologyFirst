//
//  MailButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MailButtonProtocol {
    func setupButton()
}

class MailButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension MailButton: MailButtonProtocol {
    func setupButton() {
        fastButtonCostomizing(background: .biologyGreenColor, titleColor: .white, title: "Send your Article", corner: 15, borderWidth: 2.6)
        
        setupFont()
    }
}

extension MailButton {
    private func setupFont() {
        titleLabel?.font = UIFont(name: BasicFonts.boldFont, size: 13)
    }
}
