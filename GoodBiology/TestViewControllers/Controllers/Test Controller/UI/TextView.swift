//
//  TextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestTextViewDelegate {
    func textViewSetup()
}

class TestTextView: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        textViewSetup()
    }
}

extension TestTextView: TestTextViewDelegate {
    func textViewSetup() {
        setupShadow(self)
        setupAlpha(self)
        setupFont(self)
        setupTextColor(self)
    }
}


extension TestTextViewDelegate {
    func setupShadow(_ textView: UITextView) {
        textView.textViewShadow()
        
        textView.layer.shadowColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textView.layer.shadowRadius = CGFloat(3)
    }
    
    func setupAlpha(_ textView: UITextView) {
        textView.alpha = 0
    }
    
    func setupFont(_ textView: UITextView) {
        textView.font = UIFont(name: "AvenirNext-Medium", size: 16)
    }
    
    func setupTextColor(_ textView: UITextView) {
        textView.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
}
