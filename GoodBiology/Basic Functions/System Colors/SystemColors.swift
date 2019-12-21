//
//  SystemColors.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func textSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .tertiaryLabel
        } else {
            // Fallback on earlier versions
        }
    }
    
    func textSystemColor() {
        if #available(iOS 13.0, *) {
            self.textColor = .secondaryLabel
        } else {
            // Fallback on earlier versions
        }
    }
}

extension UILabel {
    func labelSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .tertiaryLabel
        } else {
            // Fallback on earlier versions
        }
    }
    
    func labelSystemColor() {
        if #available(iOS 13.0, *) {
            self.textColor = .secondaryLabel
        } else {
            // Fallback on earlier versions
        }
    }
}

extension UIView {
    public func viewSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
        }
    }
}
