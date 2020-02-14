//
//  BasicNotesViewControllerViewSettup.swift
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
        datePickerView.isHidden            = true
        datePickerView.layer.cornerRadius  = 14
        
        pickerViewBackground.isHidden = true
    }
    
    func shadowsPrefering() {
        datePicker.pickerViewShadow()
        pickerViewBackground.viewShadows()
        pickerView.pickerViewShadow()
    }
    
    func dateButtonPrefering() {
        dateChooseButton.fastButtonCostomizing(background: lazyColor, titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Choose Time", corner: 12, borderWidth: 2.8)
    }
    
    func alphaPrefering() {
        let alpha = 0
        
        inputTextField.alpha = CGFloat(alpha)
        textView.alpha       = CGFloat(alpha)
    }
    
    func sizingPrefering() {
        textViewBackgroundView.transform = CGAffineTransform(scaleX: 0, y: 0)
        textFieldView.transform          = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    func textViews_Text_Prefering() {
        textView.text       = ""
        inputTextField.text = ""
    }
    
    func cornersPrefering() {
        pickerViewBackground.layer.cornerRadius     = 21.68
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
        let alpha = 1
        
        textViewBackgroundView.alpha = CGFloat(alpha)
        textFieldView.alpha          = CGFloat(alpha)
    }
    
    func textContainersTintSetup() {
        let tintColor = lazyColor
        
        textView.tintColor       = tintColor
        inputTextField.tintColor = tintColor
    }
}

