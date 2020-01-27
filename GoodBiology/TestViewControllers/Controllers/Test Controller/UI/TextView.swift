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
    internal func textViewSetup() {
        textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        font = UIFont(name: "AvenirNext-Medium", size: 16)
        
        alpha = 0
        
        textViewShadow()
        layer.shadowColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowRadius = CGFloat(3)
    }
}
