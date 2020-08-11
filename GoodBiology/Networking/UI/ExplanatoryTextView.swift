//
//  ExplanatoryTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ExplanatoryViewTextProtocol protocol
protocol ExplanatoryViewTextProtocol {
    func setupTextView()
}



//MARK: ExplanatoryTextView main class
final class ExplanatoryTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}



//MARK: - ExplanatoryViewTextProtocol extension
extension ExplanatoryTextView: ExplanatoryViewTextProtocol {
    internal func setupTextView() {
        setupFont()
        setupTextColor()
    }
}



//MARK: - ExplanatoryTextView extension
extension ExplanatoryTextView {
    private func setupFont() {
        font = UIFont(name: BasicFonts.mediumFont, size: 14)
    }
    
    private func setupTextColor() {
        textColor = UIColor.systemGray
    }
}
