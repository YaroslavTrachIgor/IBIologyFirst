//
//  ArticelsViewControllerProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension UITextView: ArticelsViewControllerProtocol {
    func setupNavController() {}
    
    func articelsViewControllerTextViewSetup() {
        setSecondaryTextColor()
        setMenuFont()
    }
    
    func setSecondaryTextColor() {
        textColor = .secondaryLabel
    }
    
    func setMenuFont() {
        let size: CGFloat       = 16.5
        let fontName: String    = BasicFonts.mediumFont
        self.font = UIFont(name: fontName, size: size)
    }
}

