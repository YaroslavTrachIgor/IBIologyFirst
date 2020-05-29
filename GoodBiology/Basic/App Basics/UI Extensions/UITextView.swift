//
//  UITextView.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Setup UITextView basics
extension UITextView {
    public func switchTextViewPrefering() {
        
        ///Setup Properties
        self.isSelectable = false
        self.isEditable = false
        
        ///Setup text
        self.text = "Hide diffrent functions"
        
        ///Setup font
        self.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        
        ///Setup Text Color
        self.systemTextColor()
        
        ///Setup shadow
        self.textViewShadow()
    }
    
    public func systemTextColor() {
        
        //Setup Text Color
        self.textColor = .secondaryLabel
    }
}



extension UITextView {
    
    // Basics for Text Views
    public func mainTextViewTextColor(alpha: Float) {
        self.textColor  = .darkGray
        self.tintColor  = .biologyGreenColor
        self.alpha      = CGFloat(alpha)
    }
    
    public func textViewBorder() {
        self.layer.borderWidth = 1.2
        self.layer.borderColor = #colorLiteral(red: 0.6476632953, green: 0.6438156962, blue: 0.6506224871, alpha: 1)
    }
    
    public func bigContentTextViewsPrefering(size: Float) {
        self.isEditable   = false
        self.isSelectable = false
        
        self.alpha = 0
        self.font  = UIFont(name: "AvenirNext-Medium", size: CGFloat(size))
        
        self.textViewShadow()
    }
}
