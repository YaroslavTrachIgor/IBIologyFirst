//
//  LoginViewControllerGoogleDelegateSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

protocol LoginViewControllerGoogleDelegateSetupProtocol {
    func setupGoogleSignIndDelegate()
}

extension LoginViewController: LoginViewControllerGoogleDelegateSetupProtocol {
    func setupGoogleSignIndDelegate() {
        GIDSignIn.sharedInstance()?.delegate = self
    }
}
