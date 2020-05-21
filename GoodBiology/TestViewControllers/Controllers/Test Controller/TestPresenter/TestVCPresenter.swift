//
//  TestVCPresenter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 21.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: TestVCPresenterMainFunctions protocol
protocol TestVCPresenterMainFunctions {
    func setupFalseAndTrueButtons(trueButtonOutlet: UIButton, falseButtonOutlet: UIButton, shareButton: TestUIBarButtonItem, stepperViewShower: TestUIBarButtonItem)
    func setupButtonsImages_Tints(cancelButton: TestUIBarButtonItem, shareButton: TestUIBarButtonItem, stepperViewShower: TestUIBarButtonItem)
    func setupAnswerLabel(answerLabel: AnswerLabel)
    func setupViewDidApearAnimation(objectsArray: [UIView], testTextView: UITextView, secondTextView: UITextView)
}


//MARK: TestVCPresenter Main Class
final class TestVCPresenter { }



//MARK: Main Functions (or TestVCPresenterMainFunctions)
extension TestVCPresenter: TestVCPresenterMainFunctions {
    public func setupFalseAndTrueButtons(trueButtonOutlet: UIButton, falseButtonOutlet: UIButton, shareButton: TestUIBarButtonItem, stepperViewShower: TestUIBarButtonItem) {
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
    
    
    public func setupButtonsImages_Tints(cancelButton: TestUIBarButtonItem, shareButton: TestUIBarButtonItem, stepperViewShower: TestUIBarButtonItem) {
        
        /// Setup cancelButton
        cancelButton.setupTestUIBarButtonItemImageFast(image: "arrow.clockwise")
        
        /// Setup shareButton
        shareButton.tintColor = .biologyGreenColor
        shareButton.isEnabled = false
        
        /// Setup stepperViewShower
        stepperViewShower.setupTestUIBarButtonItemImageFast(image: "textformat.size")
    }
    
    
    public func setupAnswerLabel(answerLabel: AnswerLabel) {
        answerLabel.text = BasicTestWords.answerWord
    }
    
    public func setupViewDidApearAnimation(objectsArray: [UIView], testTextView: UITextView, secondTextView: UITextView) {
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
        
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8,   initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                    let alpha: CGFloat = 1
        
                    testTextView.alpha   = alpha
                    secondTextView.alpha = alpha
                })
            })
        }
    }
}



//MARK: TestVCDoneTest
extension TestVCPresenter {
    public func setDoneButtonEnabled(doneButton: DoneButton) {
        doneButton.isEnabled = TestScores.shared.doneButtonEnabled
    }
}



//MARK: - TestTextViews Font Change
extension TestVCPresenter {
    public func stepperViewShowerAction(stepperView: UIView, cancelButton: TestUIBarButtonItem, shareButton: UIBarButtonItem) {
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
    
    
    public func setContentTextViewFont(textView1: UITextView, textView2: UITextView, stepper: UIStepper) {
        let font  = textView1.font?.fontName
        let font2 = textView2.font?.fontName
        
        let fontSize  = CGFloat(stepper.value)
        let fontSize2 = CGFloat(stepper.value)
        
        textView1.font   = UIFont(name: font!, size: fontSize)
        textView2.font = UIFont(name: font2!, size: fontSize2)
    }
}



//MARK: - TestTextViews Font Change
extension TestVCPresenter {
    public func setupErrorAnswerIsDefault(for vc: UIViewController) {
        FastAlert.showBasic(title: BasicTestWords.errorWord, message: "You haven't answerd yet", vc: vc)
    }
    
    
    public func setupCancel(answerLabel: AnswerLabel, falseButtonOutlet: UIButton, trueButtonOutlet: UIButton, shareButton: UIBarButtonItem, stepperViewShower: UIBarButtonItem) {
        trueButtonOutlet.setTitle(BasicTestWords.itsTrueWord, for: .normal)
        falseButtonOutlet.setTitle(BasicTestWords.itsTrueWord, for: .normal)
        
        falseButtonOutlet.setTitleColor(.biologyGreenColor, for: .normal)
        falseButtonOutlet.layer.borderColor = #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        falseButtonOutlet.testButtonsShadows()
        
        trueButtonOutlet.isEnabled  = true
        falseButtonOutlet.isEnabled = true
        
        shareButton.isEnabled       = false
        stepperViewShower.isEnabled = true
        
        trueButtonOutlet.alpha  = 1
        falseButtonOutlet.alpha = 1
        
        answerLabel.text = BasicTestWords.answerWord
        answerLabel.textColor = .secondaryLabel
    }
    
    
    public func setupDefaultCancelError(for vc: UIViewController) {
        FastAlert.showBasic(title: "Unavailable", message: nil, vc: vc)
    }
}



//MARK: - Sharing
extension TestVCPresenter {
    public func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    
    public func fastActivityVCforTest(item: String, for vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = vc.view
            
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
            
        vc.present(activityVC, animated: true)
    }
}



//MARK: - True Function
extension TestVCPresenter {
    public func trueAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1008))
    }
    
    
    public func trueActionFunction(answerLabel: AnswerLabel) {
        answerLabel.text      = BasicTestWords.trueWord
        answerLabel.textColor = .biologyGreenColor
        
        TestScores.shared.testScore += 10
    }
}



//MARK: - False Function
extension TestVCPresenter {
    public func falseAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1009))
    }
    
    
    public func falseActionSetup(answerLabel: AnswerLabel) {
        answerLabel.text        = BasicTestWords.falseWord
        answerLabel.textColor   = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
}
