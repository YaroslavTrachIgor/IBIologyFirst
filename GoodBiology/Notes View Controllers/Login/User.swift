//
//  User.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import AuthenticationServices

struct User {
    let id:         String
    let firstName:  String
    let lastName:   String
    let email:      String
    
    @available(iOS 13.0, *)
    init(credentials: ASAuthorizationAppleIDCredential) {
        self.id         = credentials.user
        self.firstName  = credentials.fullName?.givenName ?? ""
        self.lastName   = credentials.fullName?.familyName ?? ""
        self.email      = credentials.email ?? ""
    }
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        ID: \(id)
        First Name: \(firstName)
        Last Name: \(lastName)
        Email: \(email)
        """
    }
}
