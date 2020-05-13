//
//  BasicsViewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicsViewControllerViewSetupProtocol {
    // Setup UIView
    func viewBasics()
    
    func prepareBackgroundView()
    func systemBackPrefering()
    func editorsViewTextPrefering()
    func cornersPrefering()
    func segmentedControlCostomizing()
    func contentTextViewFontPrefering()
    
    // UIControls Setup
    func editorsViewSetup()
    func stepperViewSetup()
    func switchViewSetup()
    func switchSetup()
    func stepperSetup()
    func segmentedControlSetup()
    func activityIndicatorSetup()
    func switchTextViewSetup()
    func contentTextViewSetup()
    
    // Load animation with activity indicator
    func loadingViewPrefering()
    
    // Set Text
    func modelsPrefering()
}

extension BasicsViewController: BasicsViewControllerViewSetupProtocol {
    func viewBasics() {
        editorsViewTextPrefering()
        segmentedControlSetup()
        activityIndicatorSetup()
        loadingViewPrefering()
        cornersPrefering()
        contentTextViewSetup()
    }
    
    func systemBackPrefering() {
        switchView.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    func prepareBackgroundView() {
        switchView.viewShadows()
        stepper.stepperShadow()
        stepperView.viewShadows()
        switchOutlet.switchShadow()
    }
    
    func editorsViewTextPrefering() {
        switchTextView.font = UIFont(name: mediumFont, size: 13)
        
        switchTextView.isEditable   = false
        switchTextView.isSelectable = false
        
        switchTextView.textViewShadow()
    }
    
    func editorsViewSetup() {
        stepperViewSetup()
        switchViewSetup()
    }
    
    func contentTextViewFontPrefering() {
        contentTextView.font = UIFont(name: "AvenirNext-Medium", size: 16.1)
    }
    
    func stepperViewSetup() {
        stepperView.editorsViews()
        stepperView.layer.cornerRadius = 10
        
        stepperSetup()
    }
    
    func switchViewSetup() {
        switchView.editorsViews()
        switchView.layer.cornerRadius = 9
        
        switchTextViewSetup()
        switchSetup()
    }
    
    func cornersPrefering() {
        stepperView.layer.cornerRadius     = CGFloat(cornerRadius)
        contentTextView.layer.cornerRadius = 30
    }
    
    func segmentedControlCostomizing() {
        segmentedControl.alpha      = 0
        segmentedControl.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    func switchSetup() {
        switchOutlet.switchBasics()
    }
    
    func stepperSetup() {
        stepper.stepperBaics()
    }
    
    func segmentedControlSetup() {
        segmentedControl.segmentedControlForToday()
        segmentedControlCostomizing()
    }
    
    func activityIndicatorSetup() {
        activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
    
    func switchTextViewSetup() {
        switchTextView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func contentTextViewSetup() {
        contentTextView.font = UIFont(name: mediumFont, size: 17)
        contentTextView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        contentTextView.textViewShadow()
    }
    
    func loadingViewPrefering() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.contentTextView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
        }
    }
    
    func modelsPrefering() {
        navigationItem.title = contentModel?.title
        contentTextView.text = contentModel?.content
    }
}
