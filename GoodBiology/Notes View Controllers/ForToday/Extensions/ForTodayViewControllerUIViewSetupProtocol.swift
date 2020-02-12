//
//  ForTodayViewControllerUIViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ForTodayViewControllerUIViewSetupProtocol {
    func basicThingsPrefering()
    func savingProccesings()
    func shadowsPrefering()
    func setupNavItemTitle()
    func UIBarButtonItemAlphaPrefering()
    func systemBackgroundPrefering()
    func UIViewsPrefering()
    func pickerPrfering()
    func loadingPrefering()
}

extension ForTodayViewController: ForTodayViewControllerUIViewSetupProtocol {
    func basicThingsPrefering() {
        textViewACHidden()
        textFieldACHidden()
        
        prepareToolBar()
        
        reminderOutletButton.notificationButtonBasics()
        segmentControl.segmentedControlForToday()
        choseTimeButton.notificationButtonBasics()
    }
    
    func savingProccesings() {
        chekLocationAuthorization()
        checkForSaved()
    }
    
    func shadowsPrefering() {
        helpButtonOutlet.buttonsShadows()
        pickerView.pickerViewShadow()
        choseTimeButton.buttonsShadows()
        dataPickerView.viewShadows()
        mapTypeView.viewShadows()
    }
    
    func setupNavItemTitle() {
        navigationItem.setTitle("Main Notes", subtitle: "For Today Section")
        navigationItem.title = ""
    }
    
    func UIBarButtonItemAlphaPrefering() {
        let isEnabled: Bool = false
        
        mapTypeButton.isEnabled            = isEnabled
        pickerViewShowingButton.isEnabled  = isEnabled
        mapViewShowingButton.isEnabled     = isEnabled
        saveButton.isEnabled               = isEnabled
    }
    
    func systemBackgroundPrefering() {
        if #available(iOS 13.0, *) {
            pickerPrfering()
            UIViewsPrefering()
        }
    }
    
    func UIViewsPrefering() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            
            mainView.viewSystemBack()
            mapTypeView.viewSystemBack()
            dataPickerView.viewSystemBack()
        }
    }
    
    func pickerPrfering() {
        if #available(iOS 13.0, *) {
            pickerView.tintColor = .secondaryLabel
        }
    }
    
    func loadingPrefering() {
        self.textViewActivity.activityIndicatorStarts(colorOfActivity: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        UIView.animate(withDuration: 0.6, delay: 0.5, options: .curveLinear, animations: {
            self.inputTextView.alpha = 1
        }) {(finished) in
            self.textViewActivity.activityIndicatorStop()
            self.textViewActivity.isHidden = true
        }
        
        inputTextField.alpha = 0
        textFieldActivitu.activityIndicatorStarts(colorOfActivity: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        UIView.animate(withDuration: 0.6, delay: 0.5, options: .curveLinear, animations: {
            self.inputTextField.alpha = 1
        }) {(finished) in
            self.textFieldActivitu.activityIndicatorStop()
            self.textFieldActivitu.isHidden = true
        }
    }
}
