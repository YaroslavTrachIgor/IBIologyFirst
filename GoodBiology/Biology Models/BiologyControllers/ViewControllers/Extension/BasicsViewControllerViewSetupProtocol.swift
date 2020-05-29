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
    
    /// Setup view
    func viewBasics()
    
    func viewBackSetup()
    
    func prepareShadows()
    func systemBackPrefering()
    func editorsViewTextPrefering()
    func cornersPrefering()
    func segmentedControlCostomizing()
    func contentTextViewFontPrefering()
    func setCorners(radius: CGFloat)
    
    /// UIControls Setup
    func editorsViewSetup()
    func stepperViewSetup()
    func switchViewSetup()
    func switchSetup()
    func stepperSetup()
    func segmentedControlSetup()
    func activityIndicatorSetup()
    func switchTextViewSetup()
    func contentTextViewSetup()
    
    /// Load animation with activity indicator
    func loadingViewPrefering()
    
    /// Set content
    func modelContentSetup()
    
    /// Navigation Bar Setup
    func navigationControllerSetup()
    
    /// ViewDidApearAnimation Setup
    func viewDidApearAnimationSetup()
}


// MARK: - BasicsViewControllerViewSetupProtocol
extension BiologyViewController: BasicsViewControllerViewSetupProtocol {
    
    //MARK: ViewDidApearAnimation Setup
    func viewDidApearAnimationSetup() {
        let objectsArray = [switchViewShowingButtonBackView ,stepperViewShowingButtonBack  ,segmentedControl ,backgroundView, notificationButton, switchView, stepperView]
        
        for (index, view) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.3
            setupAnimation(view: view, delay: delay)
        }
    }
    
    func setupAnimation(view: UIView?, delay: Double) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view?.alpha = 1
            })
        }
    }
    
    //MARK: Setup View
    func viewBasics() {
        editorsViewTextPrefering()
        segmentedControlSetup()
        activityIndicatorSetup()
        loadingViewPrefering()
        cornersPrefering()
        contentTextViewSetup()
        viewBackSetup()
    }
    
    func viewBackSetup() {
        view.backgroundColor = .groupTableViewBackground
    }
    
    func systemBackPrefering() {
        switchView.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    func prepareShadows() {
        switchView.viewShadows()
        stepper.stepperShadow()
        stepperView.viewShadows()
        switchOutlet.switchShadow()
    }
    
    func editorsViewTextPrefering() {
        switchTextView.font = UIFont(name: BasicFonts.mediumFont, size: 13)
        
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
        stepperView.alpha = 1
        stepperView.layer.cornerRadius = 10
        
        stepperSetup()
    }
    
    func switchViewSetup() {
        switchView.editorsViews()
        switchView.layer.cornerRadius = 9
        switchView.alpha = 1
        
        switchTextViewSetup()
        switchSetup()
    }
    
    func cornersPrefering() {
        stepperView.layer.cornerRadius     = CGFloat(12)
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
        contentTextView.font = UIFont(name: BasicFonts.mediumFont, size: 17)
    }
    
    func loadingViewPrefering() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.contentTextView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
        }
    }
    
    func setCorners(radius: CGFloat) {
        backgroundView.layer.cornerRadius = radius
    }
    
    
    //MARK: Setup Content
    func modelContentSetup() {
        title                = contentModel?.title
        contentTextView.text = contentModel?.content
    }
    
    
    //MARK: Setup NavigationBar
    func navigationControllerSetup() {
        let navBar = navigationController?.navigationBar
        
        /// Setup Bar colors
        navBar?.tintColor       = .biologyGreenColor
        navBar?.backgroundColor = .white
        navBar?.barTintColor    = .white
        navBar?.barStyle        = .default
        
        /// Setup Bar Large Titles
        navBar?.prefersLargeTitles = false
    }
}
