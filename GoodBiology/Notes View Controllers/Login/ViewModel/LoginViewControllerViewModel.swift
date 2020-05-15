//
//  LoginViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AuthenticationServices

class LoginViewControllerViewModel {
    func setupLoginButton(_ loginButton: UIButton) {
        let appleButton = AppleButtonSettings()
        
        /// set TitleColor
        loginButton.setTitleColor(appleButton.titleColor, for: .normal)
        
        /// backgroundColor setuo
        loginButton.backgroundColor = appleButton.backgroundColor
        
        /// cornerRadius setup
        loginButton.layer.cornerRadius = 17
        
        /// titleLabel?.font setup
        loginButton.titleLabel?.font = appleButton.font
        
        /// alpha setup
        loginButton.alpha = 0
    }
    
    func setupGoButton(_ goButton: UIButton) {
        let appleButton = AppleButtonSettings()
        
        goButton.isEnabled = false
        goButton.alpha     = 0
        
        goButton.setTitleColor(appleButton.titleColor, for: .normal)
        goButton.backgroundColor        = appleButton.backgroundColor
        goButton.layer.cornerRadius     = 17
        goButton.titleLabel?.font       = appleButton.font
        goButton.setTitle("Continue", for: .normal)
    }
    
    func emailButtonSetup(_ emailButton: UIButton) {
        let appleButton = AppleButtonSettings()
        
        emailButton.isEnabled = true
        emailButton.alpha     = 1
        
        emailButton.setTitleColor(appleButton.titleColor, for: .normal)
        emailButton.backgroundColor        = appleButton.backgroundColor
        emailButton.layer.cornerRadius     = 17
        emailButton.titleLabel?.font       = appleButton.font
        emailButton.setTitle("Sign In with Email", for: .normal)
    }
    
    func systemBackground(_ view: UIView) {
        view.viewSystemBack()
    }
    
    func buttonsSetup(loginButton: UIButton) {
        if DeviceType.IS_IPHONE_7 || DeviceType.IS_IPHONE_7P {
             loginButton.setTitle("Sign In with Touch ID", for: .normal)
        } else {
            loginButton.setTitle("Sign In with Face ID", for: .normal)
        }
        loginButton.alpha = 0
    }
    
    func setupLogOutEnabled(logOutButton: UIBarButtonItem, goButton: UIButton) {
        let appleButton = AppleButtonSettings()
        
        if goButton.backgroundColor == appleButton.backgroundColor {
            logOutButton.isEnabled = false
        } else {
            logOutButton.isEnabled = true
        }
    }
    
    func setupNavController(_ navController: UINavigationController) {
        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.barStyle    = .default
    }
    
    func setupAuthorizationAppleIDRequest(request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
}
