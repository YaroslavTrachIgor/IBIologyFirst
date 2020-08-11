//
//  MakingArticleVCContentRulesTextView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MakingArticleVCContentRulesTextViewProtocol {
    func setupTextView()
}

final class MakingArticleVCContentRulesTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextView()
    }
}

extension MakingArticleVCContentRulesTextView: MakingArticleVCContentRulesTextViewProtocol {
    func setupTextView() {
        /// Basic
        bigContentTextViewsPrefering(size: 16)
        
        hiddenSetup()
        setupText_TextColor()
    }
}

extension MakingArticleVCContentRulesTextView {
    private func setupText_TextColor() {
        
        /// Text
        text = MakingArticleViewControllerData.contentRulesTextViewText
        
        /// Text Color
        textColor  = #colorLiteral(red: 0.28364219, green: 0.3071055974, blue: 0.3411921003, alpha: 1)
    }
    
    private func hiddenSetup() {
        alpha    = 1
        isHidden = false
    }
}
