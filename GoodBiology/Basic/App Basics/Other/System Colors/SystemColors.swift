//
//  SystemColors.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UITextView public extension
public extension UITextView {
    func textSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .tertiaryLabel
        }
    }
    
    func textSystemColor() {
        if #available(iOS 13.0, *) {
            self.textColor = .secondaryLabel
        }
    }
}



//MARK: - UILabel public extension
public extension UILabel {
    func labelSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .tertiaryLabel
        }
    }
    
    func labelSystemColor() {
        if #available(iOS 13.0, *) {
            self.textColor = .secondaryLabel
        }
    }
}




//MARK: - UIView public extension
public extension UIView {
    func viewSystemBack() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        }
    }
}
