//
//  SettingsTableViewControllerRealmProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SettingsControllerEmailDataModel: Object {
    @objc dynamic var email = ""
    @objc dynamic var id    = ""
}

class UserNamesModel: Object {
    // Name
    @objc dynamic var firstName  = ""
    @objc dynamic var familyName = ""
    
    // ID
    @objc dynamic var id = ""
}

class AllUserInfo: Object {
    // Name
    @objc dynamic var firstName  = ""
    @objc dynamic var familyName = ""
    
    // Email
    @objc dynamic var email = ""
    
    // Date
    @objc dynamic var date = ""
    
    // Age
    @objc dynamic var age = ""
    
    // Country
    @objc dynamic var country = ""
    
    // Phone Number
    @objc dynamic var phone = ""
    
    // ID
    @objc dynamic var id = ""
}

protocol SettingsTableViewControllerRealmProtocol {
    func realmEmailPost()
    func realmNamePost()
    func allAvailableInfoPost()
}

extension SettingsTableViewController: SettingsTableViewControllerRealmProtocol {
    func allAvailableInfoPost() {
        let model = AllUserInfo()
        let emptyWord = "Empty"
        if !(emailTextField.text!.isEmpty && nameTextField.text!.isEmpty && phoneNumberTextField.text!.isEmpty) && emailTextField.text!.isValidEmail() && (phoneNumberTextField.text!.count >= 10){
            
            //MARK: - TextFields Text Post
            
            ///firstName
            model.firstName = nameTextField.text!
            
            /// familyName
            if secondNameTextField.text!.isEmpty {
                model.familyName = emptyWord
            } else {
                model.familyName = secondNameTextField.text!
            }
            
            /// age
            if ageTextField.text!.isEmpty {
                model.age = emptyWord
            } else {
                model.age = ageTextField.text!
            }
            
            /// email
            model.email = emailTextField.text!
            
            /// phone
            model.phone = phoneNumberTextField.text!
            
            /// date
            if birthdayTextField.text!.isEmpty {
                model.date = emptyWord
            } else {
                model.date = birthdayTextField.text!
            }
            
            /// country
            if countryTextField.text!.isEmpty {
                model.country = emptyWord
            } else {
                model.country = countryTextField.text!
            }
            
            // MARK: - SET ID
            let id: String = String(Int.random(in: 0...9)) + "ID" + String(Int.random(in: 10...99)) + "USER" + String(Int.random(in: 100...999)) + "SettingsTableViewController" +  String(Int.random(in: 100...999))
            model.id = id
            
            try! ArticlesViewCountModelProperties.realm?.write {
                ArticlesViewCountModelProperties.realm?.add(model)
            }
        }
    }
    
    func realmNamePost() {
        let fullName: String = nameTextField.text! + " " + secondNameTextField.text!
        
        /// SETUP fullName ID
        let id: String = String(Int.random(in: 0...9)) + "ID" + String(Int.random(in: 10...99)) + "FULLNAME" + String(Int.random(in: 100...999))
        let model = UserNamesModel()
        
        /// CHECK
        if fullName.isValidFullName() {
            
            /// SET VARIBLES
            model.id = id
            model.familyName = secondNameTextField.text!
            model.firstName = nameTextField.text!
            
            /// WRITE
            try! ArticlesViewCountModelProperties.realm?.write {
                ArticlesViewCountModelProperties.realm?.add(model)
            }
        }
    }
    
    func realmEmailPost() {
        
        /// Email
        let email = emailTextField.text!
        
        /// CHECK
        if email.isValidEmail() == true {
             
            /// SettingsControllerEmailDataModel
            let model = SettingsControllerEmailDataModel()
            
            /// SETUP EMAIL ID
            let id = String(Int.random(in: 0...9)) + "ID" + String(Int.random(in: 10...99)) + "Email" + String(Int.random(in: 100...999))
            
            /// SET VARIBLES
            model.email = email
            model.id = id
            
            /// WRITE
            try! ArticlesViewCountModelProperties.realm?.write {
                ArticlesViewCountModelProperties.realm?.add(model)
            }
        }
    }
}
