//
//  BasicGoogleSignInButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleSignIn

protocol BasicGoogleSignInButtonProtocol {
    func setupButton()
}

class BasicGoogleSignInButton: GIDSignInButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension BasicGoogleSignInButton: BasicGoogleSignInButtonProtocol {
    func setupButton() {
        setupBasicProperties()
    }
}

extension BasicGoogleSignInButton {
    private func setupBasicProperties() {
        
        /// Alpha
        alpha = 0.015
        
        /// Enabled
        isEnabled = true
        
        /// Hidden
        isHidden = false
    }
}
