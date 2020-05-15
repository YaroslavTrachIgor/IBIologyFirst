//
//  TestTextViewsFontChange.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - TestTextViews Font Change
extension TestViewController {
    
    //MARK: @IBAction
    @IBAction func stepper(_ sender: UIStepper) {
        let font  = testTextView.font?.fontName
        let font2 = secondTextView.font?.fontName
        
        let fontSize  = CGFloat(sender.value)
        let fontSize2 = CGFloat(sender.value)
        
        testTextView.font   = UIFont(name: font!, size: fontSize)
        secondTextView.font = UIFont(name: font2!, size: fontSize2)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: "iBIOLOGY_TESTs_VC")
    }
    
    @IBAction func stepperViewShowerAction(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden    = false
            
            cancelButton.isEnabled  = false
            shareButton.isEnabled   = false
        } else {
            stepperView.isHidden    = true
            
            cancelButton.isEnabled  = true
            shareButton.isEnabled   = false
        }
    }
}
