//
//  SettingsTableViewControllerLoadSettings.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension SettingsTableViewController {
    public func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: SettingsKeys.nameKey) {
            nameTextField.text = name
        }
        
        if let secondName = UserDefaults.standard.string(forKey: SettingsKeys.secondNameKey) {
            secondNameTextField.text = secondName
        }
        
        if let email = UserDefaults.standard.string(forKey: SettingsKeys.emailKey) {
            emailTextField.text = email
        }
        
        if let age = UserDefaults.standard.string(forKey: SettingsKeys.ageKey) {
            ageTextField.text = age
        }
        
        if let secondEmail = UserDefaults.standard.string(forKey: SettingsKeys.secondEmailKey) {
            secondEmailTextField.text = secondEmail
        }
        
        if let country = UserDefaults.standard.string(forKey: SettingsKeys.countryKey) {
            countryTextField.text = country
        }
        
        if let birthday = UserDefaults.standard.string(forKey: SettingsKeys.birthdayKey) {
            birthdayTextField.text = birthday
        }
        
        if let phone = UserDefaults.standard.string(forKey: SettingsKeys.phoneKey) {
            phoneNumberTextField.text = phone
        }
        
        let data = UserDefaults.standard.object(forKey: SettingsKeys.imageKey) as! NSData?
        if data != nil {
            usersIconImageView.image = UIImage(data: (data!) as Data)
        } else {
            return
        }
    }
}
