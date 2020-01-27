//
//  BasicASAuthorizationAppleIDButton.swift
//  GoodBiology
//
//  Created by Yaroslav on 18.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import AuthenticationServices
import UIKit
import LocalAuthentication

protocol BasicAuthenticationServicesProtocol {
    func setupConstrains()
    func setupView()
}

class BasicAuthenticationAppleButtonServices: ASAuthorizationAppleIDButton {
    override init(authorizationButtonType type: ASAuthorizationAppleIDButton.ButtonType, authorizationButtonStyle style: ASAuthorizationAppleIDButton.Style)  {
        super.init(authorizationButtonType: type, authorizationButtonStyle: style)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    
    private func setupButton() {
        setupConstrains()
        setupView()
    }
}

extension BasicAuthenticationAppleButtonServices: BasicAuthenticationServicesProtocol {
    func setupConstrains() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupView() {
        viewShadows()
        
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        cornerRadius = 9
        
        isHidden = false
    }
}
