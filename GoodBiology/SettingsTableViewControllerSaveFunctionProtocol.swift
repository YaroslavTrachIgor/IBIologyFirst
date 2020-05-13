//
//  SettingsTableViewControllerSaveFunctionProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 25.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsTableViewControllerSaveFunctionProtocol {
    func setupSaveErrors() throws
    func showSaveErrors()
}

extension SettingsTableViewController: SettingsTableViewControllerSaveFunctionProtocol {
    
    enum Errors: Error {
        case nameError
        case emailError
    }
    
    func setupSaveErrors() throws {
        if !(emailTextField.text?.contains("@"))! || !(emailTextField.text?.contains("."))! || emailTextField.text!.count <= 4 {
            throw Errors.emailError
            
        } else if nameTextField.text!.count >= 30 || nameTextField.text!.count <= 2 {
            throw Errors.nameError
            
        } else if secondNameTextField.text!.count >= 30 || secondNameTextField.text!.count <= 2 {
            throw Errors.nameError
        }
    }
    
    func showSaveErrors() {
        do {
            try setupSaveErrors()
            
        } catch Errors.emailError where !emailTextField.text!.isEmpty {
            FastAlert.showBasic(title: "Error saving your email", message: "Your email address is incorrect. Check for characters in it: '@', '.' and so on. Also check how big or small it is.", vc: self)
            
        } catch Errors.nameError where !nameTextField.text!.isEmpty || !secondNameTextField.text!.isEmpty {
            FastAlert.showBasic(title: "Error saving your name", message: "Check how big or small it is.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: "Error saving your data.", message:
                "Check that the fields 'First Name', 'Last Name', 'Mail' were completed.", vc: self)
        }
    }
}
