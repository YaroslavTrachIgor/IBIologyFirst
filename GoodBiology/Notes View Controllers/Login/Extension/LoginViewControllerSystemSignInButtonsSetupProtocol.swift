//
//  LoginViewControllerSystemSignInButtonsSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewControllerSystemBackSetupProtocol {
    func systemBackground()
}

protocol LoginViewControllerSystemSignInButtonsSetupProtocol {
    func buttonsSetup()
    
    // setup goButton and loginButton
    func setupLoginButton()
    func setupGoButton()
}

extension LoginViewController: LoginViewControllerSystemBackSetupProtocol, LoginViewControllerSystemSignInButtonsSetupProtocol {
    
    func setupLoginButton() {
        viewModel.setupLoginButton(loginButton)
        viewModel.emailButtonSetup(emailButton)
    }
    
    func setupGoButton() {
        viewModel.setupGoButton(goButton)
    }
    
    func systemBackground() {
        viewModel.systemBackground(view)
    }
    
    func buttonsSetup() {
        setupGoButton()
        setupLoginButton()
        
        viewModel.buttonsSetup(loginButton: loginButton)
        viewModel.setupLogOutEnabled(logOutButton: logOutButton, goButton: goButton)
    }
}
