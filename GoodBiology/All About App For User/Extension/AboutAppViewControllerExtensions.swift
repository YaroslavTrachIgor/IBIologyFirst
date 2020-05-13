//
//  AboutAppViewControllerExtensions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension AboutAppViewController: AboutAppVCSetupProtocol {
    
    /// for viewDidLoad
    func setupVC() {
        viewsPrefering()
        uiAlphaPrefering()
        navItem()
        systemBackSetup()
    }
}

extension AboutAppViewController {
    
    //MARK: Public
    /// Making Fast Activity VC
    func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //MARK: Private
    /// Setup Colors for dark and light mode
    private func systemBackSetup() {
        stepperView.viewSystemBack()
        contentTextView.systemTextColor()
        view.viewSystemBack()
    }
    
    /// setup all main UI for this VC
    private func viewsPrefering() {
        stepperViewSetup()
        preferingCorners()
        contentTextViewPrefering()
    }
    
    /// Setup StepperView
    private func stepperViewSetup() {
        stepperView.editorsViews()
        stepperView.isHidden = true
        
        stepper.stepperBaics()
    }
    
    /// Set Alpha for UI in this VC
    private func uiAlphaPrefering() {
        let alpha: CGFloat = 0
        
        contentBackground.alpha = alpha
        contentTextView.alpha   = alpha
    }
    
    /// Setup contentTextView
    private func contentTextViewPrefering() {
        contentTextView.bigContentTextViewsPrefering(size: 16)
    }
    
    /// Set NavigationItem Title
    private func navItem() {
        title = "General"
    }
    
    /// Set Corners for UI in This Controller
    private func preferingCorners() {
        let cornerRadius = 20
        
        contentTextView.layer.cornerRadius   = CGFloat(cornerRadius)
        contentBackground.layer.cornerRadius = CGFloat(cornerRadius)
    }
}
