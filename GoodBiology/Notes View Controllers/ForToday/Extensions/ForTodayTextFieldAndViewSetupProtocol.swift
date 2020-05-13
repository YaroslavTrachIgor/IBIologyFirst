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
        viewModel.setToolBar(textView: inputTextView, textField: inputTextField, toolBar: toolBar)
    }
    
    func textViewACHidden() {
        guard let inputTextViewText = inputTextView.text else { return }
        if inputTextViewText.isEmpty { textViewActivity.isHidden = true }
    }
    
    func textFieldACHidden() {
        guard let inputTextFieldText = inputTextView.text else { return }
        if inputTextFieldText.isEmpty { textFieldActivitu.isHidden = true }
    }
    
    func textColorPrefering() {
        viewModel.setTextViewsTextColor(textView: inputTextView, textField: inputTextField)
    }
    
    func textContainersTintSetup() {
        viewModel.setTextViewsTintColor(textView: inputTextView, textField: inputTextField)
    }
    
    func cornersPrefering() {
        viewModel.setupTextViewBackCorners(textViewBackground)
    }
}
