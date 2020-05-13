//
//  ReadingOnTimeViewControllerAlertTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ReadingOnTimeViewControllerAlertTextViewProtocol {
    func setupTextView()
}

class ReadingOnTimeViewControllerAlertTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}
 
extension ReadingOnTimeViewControllerAlertTextView: ReadingOnTimeViewControllerAlertTextViewProtocol {
    func setupTextView() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 12
    }
}
