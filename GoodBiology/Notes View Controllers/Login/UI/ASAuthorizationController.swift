//
//  ASAuthorizationController.swift
//  GoodBiology
//
//  Created by Yaroslav on 18.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import AuthenticationServices
import UIKit
import LocalAuthentication

class BasicASAuthorizationController: ASAuthorizationController {
    override init(authorizationRequests: [ASAuthorizationRequest]) {
        super.init(authorizationRequests: authorizationRequests)
        
        setupView()
    }
    
    private func setupView() {
        performRequests()
    }
}

