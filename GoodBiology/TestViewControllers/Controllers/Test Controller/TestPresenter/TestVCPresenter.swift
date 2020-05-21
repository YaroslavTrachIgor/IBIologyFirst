//
//  TestVCPresenter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 21.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class TestVCPresenter {
    
    // Answer Label
    var answerLabel = UILabel()
    
    // True and False Buttons
    var trueButtonOutlet  = UIButton()
    var falseButtonOutlet = UIButton()
    
    // stepperView
    var stepperView = UIView()
    var stepperOutlet = UIStepper()
    
    // Content TextViews
    var secondTextView = UITextView()
    var testTextView   = UITextView()
    
    // Content TextViewBacks
    var testView = UIView()
    var secondTestView = UIView()
    
    // UIBarButtonItems
    var stepperViewShower       = UIBarButtonItem()
    var shareButton             = UIBarButtonItem()
    var cancelButton            = UIBarButtonItem()
    var doneButton              = UIBarButtonItem()
    var goToNextTestPageButton  = UIBarButtonItem()
    
    
    init(answerLabel: UILabel, trueButtonOutlet: UIButton, falseButtonOutlet: UIButton, stepperView: UIView, stepperOutlet: UIStepper, secondTextView: UITextView, testTextView: UITextView, testView: UIView, secondTestView: UIView, stepperViewShower: UIBarButtonItem, cancelButton: UIBarButtonItem, shareButton: UIBarButtonItem, doneButton: UIBarButtonItem, goToNextTestPageButton: UIBarButtonItem) {
        self.answerLabel            = answerLabel
        self.trueButtonOutlet       = trueButtonOutlet
        self.falseButtonOutlet      = falseButtonOutlet
        self.stepperView            = stepperView
        self.stepperOutlet          = stepperOutlet
        self.secondTextView         = secondTextView
        self.testTextView           = testTextView
        self.testView               = testView
        self.secondTestView         = secondTestView
        self.cancelButton           = cancelButton
        self.shareButton            = shareButton
        self.doneButton             = doneButton
        self.goToNextTestPageButton = goToNextTestPageButton
        self.stepperViewShower      = stepperViewShower
    }
}



//MARK: Main Functions
extension TestVCPresenter {
    public func falseAndTrueButtonsForAnswersPrefering() {
        let alpha = CGFloat(0.5)
        let enabled = false
        
        trueButtonOutlet.isEnabled  = enabled
        falseButtonOutlet.isEnabled = enabled
        
        shareButton.isEnabled       = !enabled
        stepperViewShower.isEnabled = enabled
        
        trueButtonOutlet.alpha      = alpha
        falseButtonOutlet.alpha     = alpha
        
        trueButtonOutlet.setTitle(BasicTestWords.trueWord, for: .normal)
        trueButtonOutlet.setTitleColor(.biologyGreenColor, for: .normal)
        
        falseButtonOutlet.setTitle(BasicTestWords.falseWord, for: .normal)
        falseButtonOutlet.setTitleColor(#colorLiteral(red: 0.6207774878, green: 0.1583663821, blue: 0.07822974771, alpha: 0.8047945205), for: .normal)
        falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.6207774878, green: 0.1583663821, blue: 0.07822974771, alpha: 0.8047945205)
        falseButtonOutlet.testFalseButtonsShadows()
    }
}
