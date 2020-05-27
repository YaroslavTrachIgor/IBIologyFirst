//
//  TestVCMainFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Main Functions
extension TestViewController {
    internal func falseAndTrueButtonsForAnswersPrefering() {
        presenter.setupFalseAndTrueButtons(trueButtonOutlet: trueButtonOutlet, falseButtonOutlet: falseButtonOutlet, shareButton: shareButton, stepperViewShower: stepperViewShower)
    }
    
    
    internal func setupViewDidApearAnimation() {
        presenter.setupViewDidApearAnimation(objectsArray: [answerLabel, secondTestView, testView], testTextView: testTextView, secondTextView: secondTextView)
    }
    
    
    internal func setupButtonsImages_Tints() {
        presenter.setupButtonsImages_Tints(cancelButton: cancelButton, shareButton: shareButton, stepperViewShower: stepperViewShower)
    }
    
    
    internal func setupAnswerLabel() {
        presenter.setupAnswerLabel(answerLabel: answerLabel)
    }
}
