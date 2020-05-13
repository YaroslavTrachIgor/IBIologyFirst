//
//  SwitchTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol SwitchTextViewSetupProtocol {
    func setupTextView()
}

class SwitchTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}

extension SwitchTextView: SwitchTextViewSetupProtocol {
    func setupTextView() {
        setupFont()
        setupShadow()
        setupTextColor()
    }
}

extension SwitchTextView {
    func setupFont() {
        font = UIFont(name: "AvenirNext-DemiBold", size: 14)
    }
    
    func setupShadow() {
        layer.shadowRadius = 7
        
        textViewShadow()
    }
    
    func setupTextColor() {
        textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}
