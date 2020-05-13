//
//  BasicASAuthorizationAppleIDButtonSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import AuthenticationServices
import UIKit

protocol BasicASAuthorizationAppleIDButtonSetupProtocol {
    func setupButton()
}

@available(iOS 13.0, *)
class BasicASAuthorizationAppleIDButton: ASAuthorizationAppleIDButton {
    override init(authorizationButtonType type: ASAuthorizationAppleIDButton.ButtonType, authorizationButtonStyle style: ASAuthorizationAppleIDButton.Style) {
        super.init(authorizationButtonType: type, authorizationButtonStyle: style)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

@available(iOS 13.0, *)
extension BasicASAuthorizationAppleIDButton: BasicASAuthorizationAppleIDButtonSetupProtocol {
    func setupButton() {
        setupCorners()
        setupShadow()
    }
}

@available(iOS 13.0, *)
extension BasicASAuthorizationAppleIDButton {
    func setupCorners() {
        cornerRadius = 15
    }
    
    func setupShadow() {
        viewShadows()
        
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
