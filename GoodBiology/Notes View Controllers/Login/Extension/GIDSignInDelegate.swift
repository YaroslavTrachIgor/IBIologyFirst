//
//  GIDSignInDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleSignIn
import UIKit

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil { return }
        
        makeGoButtonEnabledWithAnimation()
        showWelcomeAlert(message: "Dear \(user.profile.name ?? "User")")
        
        /// For Analytics
        AnalyticsManeger.addLoginOptionsAnalytics(for: "Google")
    }
    
    private func makeGoButtonEnabledWithAnimation() {
        /// Make Cool Animation
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            let viewModel = LoginViewControllerGoogleViewModel()
            
            viewModel.setGoogleStyleGoButton(goButton: self.goButton, self.view)
        }
    }
    
    private func showWelcomeAlert(message: String?) {
        let viewModel = LoginViewControllerGoogleViewModel()
        
        viewModel.showWelcomeAlert(self, message: message)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        uiLogOut()
    }
    
    func uiLogOut() {
        
        /// Make Cool Animation
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            let viewModel = LoginViewControllerGoogleViewModel()
            
            viewModel.setNormalGoButton(goButton: self.goButton, self.view)
        }
    }
}

class LoginViewControllerGoogleViewModel {
    func setNormalGoButton(goButton: UIButton, _ mainView: UIView) {
        let appleButton: AppleButtonSettings = AppleButtonSettings()
        
        /// Set alpha
        goButton.alpha = 0.4
        
        /// Set Enabled and Hidden
        goButton.isEnabled  = false
        goButton.isHidden   = false
        
        /// Set Title
        goButton.setTitle("Continue", for: .normal)
        goButton.setTitleColor(appleButton.titleColor, for: .normal)
        
        /// Set Background
        goButton.backgroundColor = appleButton.backgroundColor
        
        /// Set Font
        goButton.titleLabel?.font = appleButton.font
        
        mainView.layoutIfNeeded()
    }
    
    func setGoogleStyleGoButton(goButton: UIButton, _ mainView: UIView) {
        
        /// Set alpha
        goButton.alpha = 1
        
        /// Set Enabled and Hidden
        goButton.isEnabled  = true
        goButton.isHidden   = false
        
        /// Set Title
        goButton.setTitle("Continue", for: .normal)
        goButton.setTitleColor(.white, for: .normal)
        
        /// Set Background
        goButton.backgroundColor = .costomGoogleColor
        
        /// Set Font
        goButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
        mainView.layoutIfNeeded()
    }
    
    func showWelcomeAlert(_ vc: UIViewController, message: String?) {
        let alertVC = UIAlertController(title:
            """
            Welcome to "For Today" Section,
            """,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Continue", style: .cancel)
        
        alertVC.setTitle(font: UIFont(name: BasicFonts.boldFont,
                                         size: 14), color: .black)
        alertVC.setMessage(font: UIFont(name: BasicFonts.mediumFont,
                                         size: 15), color: .black)
        alertVC.view.tintColor = .costomGoogleColor
        alertVC.addAction(okAction)
        
        vc.present(alertVC, animated: true)
    }
}
