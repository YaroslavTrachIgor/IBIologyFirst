//
//  SwitchTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - SwitchTextViewSetupProtocol protocol
protocol SwitchTextViewSetupProtocol {
    func setupTextView()
}

//MARK: - SwitchTextView main class
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


//MARK: - SwitchTextView main extension
extension SwitchTextView: SwitchTextViewSetupProtocol {
    func setupTextView() {
        setupFont()
        setupShadow()
    }
}

extension SwitchTextView {
    func setupFont() {
        font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func setupShadow() {
        layer.shadowRadius = 7
        textViewShadow()
    }
}
