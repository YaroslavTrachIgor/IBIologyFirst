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
        falseButtonOutlet.setTitleColor(falseTint, for: .normal)
        falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.6207774878, green: 0.1583663821, blue: 0.07822974771, alpha: 0.8047945205)
        falseButtonOutlet.testFalseButtonsShadows()
    }
    
    public func setupViewDidApearAnimation() {
        let objectsArray = [answerLabel, secondTestView, testView]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                    let alpha: CGFloat = 1
                    
                    self.testTextView.alpha   = alpha
                    self.secondTextView.alpha = alpha
                })
            })
        }
    }
    
    public func setupButtonsImages_Tints() {
        
        /// Setup cancelButton
        cancelButton.setupTestUIBarButtonItemImageFast(image: "arrow.clockwise")
        
        /// Setup shareButton
        shareButton.tintColor = barButtonsTint
        shareButton.isEnabled = false
        
        /// Setup stepperViewShower
        stepperViewShower.setupTestUIBarButtonItemImageFast(image: "textformat.size")
    }
    
    public func setupAnswerLabel() {
        answerLabel.text = BasicTestWords.answerWord
    }
}
