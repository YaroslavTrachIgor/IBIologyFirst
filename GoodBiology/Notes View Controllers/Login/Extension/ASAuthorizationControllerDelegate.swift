//
//  ASAuthorizationControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AuthenticationServices

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Error", error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                switch authorization.credential {
                case let credentials as ASAuthorizationAppleIDCredential:
                    let user = User(credentials: credentials)
                    self.performSegue(withIdentifier: "segue", sender: user)
                default:
                    break
                }
            }
        }
    }
}
