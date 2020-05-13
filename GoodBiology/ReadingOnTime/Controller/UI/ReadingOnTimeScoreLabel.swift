//
//  ReadingOnTimeScoreLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ReadingOnTimeScoreLabelSetupProtocol {
    func setupLabel()
}

final class ReadingOnTimeScoreLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}

extension ReadingOnTimeScoreLabel: ReadingOnTimeScoreLabelSetupProtocol {
    func setupLabel() {
        setupTextColor()
        setupFont()
    }
}

extension ReadingOnTimeScoreLabel {
    private func setupTextColor() {
        textColor = #colorLiteral(red: 0.1603574838, green: 0.173622552, blue: 0.192893401, alpha: 1)
    }
    
    private func setupFont() {
        
        /// font name
        let fontName = "HelveticaNeue-Bold"
        
        /// font size
        let fontSize: CGFloat = 17
        
        /// UIFont
        let font = UIFont(name: fontName, size: fontSize)
        
        self.font = font
    }
}
 
