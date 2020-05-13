//
//  PopularInfoTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 16.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol PopularInfoTextViewProtocol {
    func setupTextView()
}

final class PopularInfoTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}

extension PopularInfoTextView: PopularInfoTextViewProtocol {
    func setupTextView() {
        setFont()
        setTextColor()
        setTint()
        setText()
    }
}

extension PopularInfoTextView {
    private func setText() {
        text = PupularInfoContent.content
    }
    
    private func setTint() {
        tintColor = .biologyGreenColor
    }
    
    private func setTextColor() {
        textColor = #colorLiteral(red: 0.2207962799, green: 0.2390609573, blue: 0.2655949966, alpha: 1)
        isEditable = false
    }
    
    private func setFont() {
        font = UIFont(name: "AvenirNext-Medium", size: 23)
    }
}
