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
    public func falseAndTrueButtonsForAnswersPrefering() {
        presenter.setupFalseAndTrueButtons(trueButtonOutlet: trueButtonOutlet, falseButtonOutlet: falseButtonOutlet, shareButton: shareButton, stepperViewShower: stepperViewShower)
    }
    
    
    public func setupViewDidApearAnimation() {
        presenter.setupViewDidApearAnimation(objectsArray: [answerLabel, secondTestView, testView], testTextView: testTextView, secondTextView: secondTextView)
    }
    
    
    public func setupButtonsImages_Tints() {
        presenter.setupButtonsImages_Tints(cancelButton: cancelButton, shareButton: shareButton, stepperViewShower: stepperViewShower)
    }
    
    
    public func setupAnswerLabel() {
        presenter.setupAnswerLabel(answerLabel: answerLabel)
    }
}
