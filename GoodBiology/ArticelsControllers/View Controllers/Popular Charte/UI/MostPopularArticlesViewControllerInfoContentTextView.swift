//
//  MostPopularArticlesViewControllerInfoContentTExtView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 23.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MostPopularArticlesViewControllerInfoContentTextViewProtocol {
    func setupTextView()
}

final class MostPopularArticlesViewControllerInfoContentTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}

extension MostPopularArticlesViewControllerInfoContentTextView: MostPopularArticlesViewControllerInfoContentTextViewProtocol {
    func setupTextView() {
        setupCorners()
        setupFont()
        setupContent()
        setupTextColor()
        setupProperties()
    }
}
 
extension MostPopularArticlesViewControllerInfoContentTextView {
    private func setupCorners() {
        layer.cornerRadius = 16
    }
    
    private func setupFont() {
        let font = UIFont(name: BasicFonts.mediumFont, size: 16)
        
        self.font = font
    }
    
    private func setupContent() {
        text = "On this screen, you can view the popularity of various articles in the application since the last update."
    }
    
    private func setupTextColor() {
        textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func setupProperties() {
        isSelectable    = false
        isScrollEnabled = true
        isEditable      = false
    }
}
