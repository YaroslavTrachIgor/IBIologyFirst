//
//  LoginViewControllerAppleSignInButtonSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewControllerAppleSignInButtonSetupProtocol {
    func setupAppleSignInButton()
}

extension LoginViewController: LoginViewControllerAppleSignInButtonSetupProtocol {
    func setupAppleSignInButton() {
        if #available(iOS 13.0, *) {
            appleSignInButton.addTarget(self, action: #selector(didTapAppleButton), for: .touchUpInside)
        } 
    }
}
