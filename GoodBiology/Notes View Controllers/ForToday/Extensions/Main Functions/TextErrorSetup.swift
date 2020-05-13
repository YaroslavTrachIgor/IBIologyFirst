//
//  TextErrorSetup.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ForTodayViewController {
    func textErrorSetup() throws {
        let hidden = true
        let alpha: CGFloat = 0
        
        guard let textFieldText = inputTextField.text, let textViewText = inputTextView.text else { return }
        
        if textViewText.isEmpty {
            throw ForTodayErrors.Errors.textViewIsntReadyForSave
            
        } else if textFieldText.isEmpty {
            throw ForTodayErrors.Errors.textFieldIsntReadyForSave
            
        } else if textViewBackground.isHidden == hidden || textViewBackground.alpha == alpha {
            throw ForTodayErrors.Errors.textFieldContentBackHidden
            
        } else if textFieldBackground.isHidden == hidden || textFieldBackground.alpha == alpha {
            throw ForTodayErrors.Errors.textFieldContentBackHidden
        }
    }
}
