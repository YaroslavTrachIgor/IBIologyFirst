//
//  SettingsTableViewControllerObserversSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsTableViewControllerObserversSetupProtocol {
    func prepareObservation()
    func prepareInputText()
}

extension SettingsTableViewController: SettingsTableViewControllerObserversSetupProtocol {
    func prepareInputText() {
        func setNameText(text: String?, field: UITextField) {
            field.text = text
        }
        
        setNameText(text: inputFirstNameText, field: nameTextField)
        setNameText(text: inputSecondNameText, field: secondNameTextField)
        setNameText(text: inputEmailText, field: emailTextField)
    }
    
    func prepareObservation() {
        firstName = observe(\.inputFirstNameText, options: .new, changeHandler: { [weak self] (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self?.nameTextField.text != "" || self?.nameTextField.text != " " {
                viewController.firstNameLabel.text = "First Name: " + updateFirstName
            }
        })
        
        secondName = observe(\.inputSecondNameText, options: .new, changeHandler: { [weak self] (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self?.secondNameTextField.text != "" || self?.secondNameTextField.text != " " {
                viewController.secondNameLabel.text = "Second Name: " + updateFirstName
            }
        })
        
        email = observe(\.inputEmailText, options: .new, changeHandler: { [weak self] (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self?.emailTextField.text != "" || self?.emailTextField.text != " " {
                viewController.inputEmailLabel.text =  updateFirstName
            }
        })
    }
}
