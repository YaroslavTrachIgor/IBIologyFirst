//
//  BasicNotesViewControllerViewSeyupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicNotesViewControllerViewSettup {
    func datePickerPrefering()
    func shadowsPrefering()
    func dateButtonPrefering()
    func alphaPrefering()
    func sizingPrefering()
    func textViews_Text_Prefering()
    func cornersPrefering()
    func activitiesPrefering()
    func systemColorsPrefering()
    func alphaSetup()
    func textContainersTintSetup()
}

extension BasicNotesViewController: BasicNotesViewControllerViewSettup {
    func datePickerPrefering() {
        datePickerView.viewShadows()
        viewModel.setViewHidden(datePickerView, hidden: true)
        viewModel.setViewAffineTransform(datePickerView, scale: 14)
        viewModel.setViewHidden(pickerViewBackground, hidden: true)
    }
    
    func shadowsPrefering() {
        datePicker.pickerViewShadow()
        pickerViewBackground.viewShadows()
        pickerView.pickerViewShadow()
    }
    
    func dateButtonPrefering() {
        dateChooseButton.fastButtonCostomizing(background: .biologyGreenColor, titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Choose Time", corner: 12, borderWidth: 2.8)
    }
    
    func alphaPrefering() {
        let alpha: CGFloat = 0
        
        viewModel.setViewAlpha(inputTextField, alpha: alpha)
        viewModel.setViewAlpha(textView, alpha: alpha)
    }
    
    func sizingPrefering() {
        textViewBackgroundView.transform = CGAffineTransform(scaleX: 0, y: 0)
        textFieldView.transform          = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    func textViews_Text_Prefering() {
        viewModel.setTextViewText(textView: textView, text: "")
        viewModel.setTextFieldText(textField: inputTextField, text: "")
    }
    
    func cornersPrefering() {
        viewModel.setViewAffineTransform(pickerViewBackground, scale: 21.68)
    }
    
    func activitiesPrefering() {
        let acTint = UIColor.darkGray
        
        textViewActivityIndicator.activityIndicatorStarts(colorOfActivity:  acTint)
        textFieldActivityIndicator.activityIndicatorStarts(colorOfActivity: acTint)
    }
    
    func systemColorsPrefering() {
        datePickerView.viewSystemBack()
        pickerView.viewSystemBack()
        pickerViewBackground.viewSystemBack()
    }
    
    func alphaSetup() {
        let alpha: CGFloat = 1
        
        viewModel.setViewAlpha(textViewBackgroundView, alpha: alpha)
        viewModel.setViewAlpha(textFieldView, alpha: alpha)
    }
    
    func textContainersTintSetup() {
        let tintColor = UIColor.biologyGreenColor
        
        viewModel.setViewTint(textView, tint: tintColor)
        viewModel.setViewTint(inputTextField, tint: tintColor)
    }
}
