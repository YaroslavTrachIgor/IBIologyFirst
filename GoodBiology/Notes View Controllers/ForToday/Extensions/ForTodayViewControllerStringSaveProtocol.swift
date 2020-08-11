//
//  ForTodayViewControllerStringSaveProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ForTodayViewController {
    func saveStringData() {
        defaults.set(inputTextView.text!,  forKey: Keys.textViewInformation )
        defaults.set(inputTextField.text!, forKey: Keys.textFieldInformation)
    }
    
    func checkForSaved() {
        let textViewShowing =  defaults.value(forKey: Keys.textViewInformation) as? String ?? ""
         inputTextView.text = textViewShowing
        
        let textFieldShowing =  defaults.value(forKey: Keys.textFieldInformation) as? String ?? ""
         inputTextField.text = textFieldShowing
    }
}
