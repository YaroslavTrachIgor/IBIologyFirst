//
//  MainFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

extension BlankSheetViewController {
    func loadSettings() {
        if let textV = UserDefaults.standard.string(forKey: Keys.textViewKey) {
            viewModel.setTextViewText(textView, text: textV)
        }
        
        if let textF = UserDefaults.standard.string(forKey: Keys.textFieldKey) {
            viewModel.setTextFieldText(textField, text: textF)
        }
    }
    
    @objc func doneButtonAction() {
        viewModel.endEditing(view)
    }
    
    func stepperViewSetup() {
        viewModel.setCorner(stepperView, corner: 20)
        viewModel.setHidden(for: stepperView, hidden: true)
        
        stepperView.viewShadows()
    }
    
    func textViewBackSetup() {
        let cornerRadius: CGFloat = 20
        
        viewModel.setCorner(textViewBack, corner: cornerRadius)
        textViewBack.viewShadows()
        
        viewModel.setCorner(textView, corner: cornerRadius)
    }
    
    func setupGoogleAdBannerView() {
        googleAdBannerView.adUnitID = "ca-app-pub-8702634561077907/9283193921"
        googleAdBannerView.rootViewController = self
        googleAdBannerView.load(GADRequest())
    }
    
    func funcTextField_and_TextViewSetup() {
        let tint = UIColor.biologyGreenColor
        let text = ""
        
        viewModel.setTextViewText(textView, text: text)
        viewModel.setTextFieldText(textField, text: text)
        
        viewModel.textFieldTintSetup(textField, tint: tint)
    }
    
    func prepareToolBar() {
        viewModel.setupInputAccessoryViews(textView: textView, textField: textField, accessoryView: toolBar)
    }
    
    func showError() {
        do {
            try setupErrors()
        } catch ForTodayErrors.Errors.textViewIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: sorryWord, message: "The application has an unknown problem.", vc: self)
        }
    }
    
    func setupErrors() throws {
        let textViewText = textView.text!
        
        if textViewText.isEmpty {
            throw ForTodayErrors.Errors.textViewIsntReadyForSave
        }
    }
}
