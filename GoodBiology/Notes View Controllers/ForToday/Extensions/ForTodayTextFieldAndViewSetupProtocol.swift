//
//  ForTodayTextFieldAndViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 11.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ForTodayTextFieldAndViewSetupProtocol {
    func prepareToolBar()
    func textViewACHidden()
    func textFieldACHidden()
    func textColorPrefering()
    func textContainersTintSetup()
    func cornersPrefering()
}

extension ForTodayViewController: ForTodayTextFieldAndViewSetupProtocol {
    func prepareToolBar() {
        inputTextField.inputAccessoryView = toolBar
        inputTextView.inputAccessoryView  = toolBar
    }
    
    func textViewACHidden() {
        if inputTextView.text == "" { textViewActivity.isHidden = true }
    }
    
    func textFieldACHidden() {
        if inputTextField.text == "" { textFieldActivitu.isHidden = true }
    }
    
    func textColorPrefering() {
        let textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        self.inputTextView.textColor  = textColor
        self.inputTextField.textColor = textColor
    }
    
    func textContainersTintSetup() {
        let tintColor = lazyColor
        
        inputTextView.tintColor     = tintColor
        inputTextField.tintColor    = tintColor
    }
    
    func cornersPrefering() {
        textViewBackground.layer.cornerRadius  = 20
    }
}
