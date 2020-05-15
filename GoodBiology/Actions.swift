//
//  Actions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

extension SettingsTableViewController {
    @IBAction func saveAllActions(_ sender: Any) {
        /// Start
        acSubViewSetup()
        acIndicatorViewSetup()
        saveImageIcon()
        navItemSetup()
        buttonsEnabledSetup()
        
        /// End
        loadAnimationSetup()
        showSaveErrors()
        realmEmailPost()
        allAvailableInfoPost()
    }
    
    @objc func hide() {
        viewModel.hideUserInfoView(view: usersInfoView, hidden: true)
    }
    
    @IBAction func userIconChange(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        viewModel.userIconChange(self, imagePicker: imagePicker)
    }
    
    @IBAction func edit(_ sender: Any) {
        viewModel.edit(userInfoView: usersInfoView, hideView: hideButtonBackView, mainView: view)
    }
    
    @IBAction func hideView(_ sender: Any) {
        viewModel.hideUserInfoView(view: usersInfoView, hidden: false)
    }
    
    @objc func doneButtonAction() {
        viewModel.doneButtonAction(view: view)
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let shareContent =
        """
            Name: \(nameTextField.text!)
            Second Name: \(secondNameTextField.text!)
            Email: \(emailTextField.text!)
            
            Age: \(ageTextField.text!)
            Country: \(countryTextField.text!)
            Second Email: \(secondEmailTextField.text!)
            Birth Day: \(birthdayTextField.text!)
            Phone: \(phoneNumberTextField.text!)
        """
        viewModel.share(item: shareContent, vc: self)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "SettingsTableViewController")
    }
    
    @IBAction func questions(_ sender: Any) {
        viewModel.questionSet(vc: self, questionAction: {
            showMailComposer()
        }())
    }
    
    @IBAction func faqSite(_ sender: Any) {
        let url = "https://zhbr282.wixsite.com/goodbiology-policy"
        
        showSafariVC(for: url)
        
        /// For Analytics
        AnalyticsManeger.addSafariFAQOpenAnalytics(for: "User(Settings)_View_Controller")
    }
    
    @IBAction func site(_ sender: Any) {
        let url = "https://zhbr282.wixsite.com/ibiology-official"
        
        showSafariVC(for: url)
        
        /// For Analytics
        AnalyticsManeger.addSafariMainSyteOpenAnalytics(for: "User(Settings)_View_Controller")
    }
    
    @IBAction func changeName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.nameKey)
        
        inputFirstNameText = nameTextField.text
    }
    
    @IBAction func changeSecondName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.secondNameKey)
        
        inputSecondNameText = secondNameTextField.text
    }
    
    @IBAction func changeEmail(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.emailKey)
        
        inputEmailText = emailTextField.text
    }
    
    @IBAction func changeAge(_ sender: UITextField) {
        viewModel.userDefaultsSet(text: sender.text!, key: SettingsKeys.ageKey)
    }
    
    @IBAction func changeSecondEmail(_ sender: UITextField) {
        viewModel.userDefaultsSet(text: sender.text!, key: SettingsKeys.secondNameKey)
    }
    
    @IBAction func changeCountry(_ sender: UITextField) {
        viewModel.userDefaultsSet(text: sender.text!, key: SettingsKeys.countryKey)
    }
    
    @IBAction func changeBirthday(_ sender: UITextField) {
        viewModel.userDefaultsSet(text: sender.text!, key: SettingsKeys.birthdayKey)
    }
    
    @IBAction func changePhoneNumber(_ sender: UITextField) {
        viewModel.userDefaultsSet(text: sender.text!, key: SettingsKeys.phoneKey)
    }
}
