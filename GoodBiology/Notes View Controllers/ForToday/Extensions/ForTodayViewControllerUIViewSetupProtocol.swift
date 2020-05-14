//
//  ForTodayViewControllerUIViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ForTodayViewController {

    private func shareButtonsAudio() {
        viewModel.setAudio(soundID: 1006)
    }
    
    
    //MARK: Public
    public func basicThingsPrefering() {
        textViewACHidden()
        textFieldACHidden()
        
        prepareToolBar()
        
        reminderOutletButton.notificationButtonBasics()
        segmentControl.segmentedControlForToday()
        choseTimeButton.notificationButtonBasics()
        
        setupSaveLabel()
    }
    
    
    public func savingProccesings() {
        chekLocationAuthorization()
        checkForSaved()
    }
    
    
    public func shadowsPrefering() {
        helpButtonOutlet.buttonsShadows()
        pickerView.pickerViewShadow()
        choseTimeButton.buttonsShadows()
        dataPickerView.viewShadows()
        mapTypeView.viewShadows()
        
        /// Setup DataPickerView Back Shadow with green Color
        dataPickerView.layer.shadowColor  = UIColor.biologyGreenColor.cgColor
        dataPickerView.layer.shadowRadius = 15
    }
    
    
    public func setupNavItemTitle() {
        navigationItem.setTitle("Main Notes", subtitle: "For Today Section")
        navigationItem.title = ""
    }
    
    
    public func UIBarButtonItemAlphaPrefering() {
        let isEnabled: Bool = false
        
        mapTypeButton.isEnabled            = isEnabled
        pickerViewShowingButton.isEnabled  = isEnabled
        mapViewShowingButton.isEnabled     = isEnabled
        saveButton.isEnabled               = isEnabled
    }
    
    
    public func systemBackgroundPrefering() {
        if #available(iOS 13.0, *) {
            pickerPrfering()
            UIViewsPrefering()
        }
    }
    
    
    public func UIViewsPrefering() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            
            mainView.viewSystemBack()
            mapTypeView.viewSystemBack()
            dataPickerView.viewSystemBack()
        }
    }
    
    
    public func pickerPrfering() {
        if #available(iOS 13.0, *) {
            pickerView.tintColor = .secondaryLabel
        }
    }
    
    
    public func setupSaveLabel() {
        let lastSaveDateLabelText = defaults.value(forKey: Keys.lastSaveLabelKey) as? String ?? "Last Save: "
        lastSaveDateLabel.text = lastSaveDateLabelText
    }
    
    
    public func loadingPrefering() {
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
    
    
    public func presentPickerViewBack() {
        if mapView.isHidden == true {
            if (pickerBackgroundView.isHidden == true) {
                self.pickerBackgroundView.isHidden = false
            } else {
                self.pickerBackgroundView.isHidden = true
            }
        } else {
            let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                searchController.view.tintColor = .biologyGreenColor
            
            present(searchController, animated: true, completion: nil)
        }
    }
    
    
    //MARK: @objc
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
}
