//
//  TestVCCancelAction.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Cancel Action
extension TestViewController {
    
    //MARK: Private
    private func cancelErrorsShow() {
        do {
            try cancelErrorsSetup()
        } catch TestErrors.CancellingErrors.answerIsDefault {
            FastAlert.showBasic(title: BasicTestWords.errorWord, message: "You haven't answerd yet", vc: self)
            
        } catch TestErrors.CancellingErrors.cancel {
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
        } catch {
            FastAlert.showBasic(title: "Unavailable", message: nil, vc: self)
        }
    }
    
    private func cancelErrorsSetup() throws {
        if answerLabel.text == BasicTestWords.answerWord {
            throw TestErrors.CancellingErrors.answerIsDefault
        } else {
            throw TestErrors.CancellingErrors.cancel
        }
    }
    
    
    //MARK: @IBAction
    @IBAction func cancel(_ sender: Any) {
        cancelErrorsShow()
    }
}
