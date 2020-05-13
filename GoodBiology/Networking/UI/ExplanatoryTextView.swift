//
//  ExplanatoryTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ExplanatoryViewTextProtocol {
    func setupTextView()
}

class ExplanatoryTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}

extension ExplanatoryTextView: ExplanatoryViewTextProtocol {
    func setupTextView() {
        setupFont()
        setupTextColor()
    }
}

extension ExplanatoryTextView {
    private func setupFont() {
        font = UIFont(name: BasicFonts.mediumFont, size: 14)
    }
    
    private func setupTextColor() {
        textColor = UIColor.systemGray
    }
}
