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
            presenter.setupErrorAnswerIsDefault(for: self)
            
        } catch TestErrors.CancellingErrors.cancel {
            presenter.setupCancel(answerLabel: answerLabel, falseButtonOutlet: falseButtonOutlet, trueButtonOutlet: trueButtonOutlet, shareButton: shareButton, stepperViewShower: stepperViewShower)
            
        } catch {
            presenter.setupDefaultCancelError(for: self)
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
