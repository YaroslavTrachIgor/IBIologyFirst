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
        presenter.setContentTextViewFont(textView1: testTextView, textView2: secondTextView, stepper: sender)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: "iBIOLOGY_TESTs_VC")
    }
    
    @IBAction func stepperViewShowerAction(_ sender: Any) {
        presenter.stepperViewShowerAction(stepperView: stepperView, cancelButton: cancelButton, shareButton: shareButton)
    }
}
