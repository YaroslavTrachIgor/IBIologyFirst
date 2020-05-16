//
//  LoginViewControllerMainFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleSignIn
import UIKit
import FirebaseUI
import FirebaseAuth

//MARK: - Main Functions
extension LoginViewController {
    func setupLogOut() {
        GIDSignIn.sharedInstance()?.signOut()
        
        if goButton.backgroundColor == .costomGoogleColor {
            FastAlert.showBasic(title: "Operation complete", message: "You are logged out of your Google account.", vc: self)
        } else {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "You did not enter your Google account", vc: self)
        }
    }
    
    func setupLoginWithEmail() {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else { return }
        authUI?.delegate = self
        let authVC = authUI!.authViewController()
        present(authVC, animated: true)
    }
    
    func setupViewDidApearAnimation() {
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.loginButton.alpha        = alpha
            self.goButton.alpha           = 0.6
        }
        setupNavController()
    }
}
