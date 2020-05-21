//
//  TestVCTrueAction.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: - Setup - True Action
extension TestViewController {
    @IBAction func trueButton(_ sender: UIButton) {
        trueShow()
        trueAudio()
        
        /// Animation
        sender.flash()
    }
    
    private func trueShow() {
        presenter.trueActionFunction(answerLabel: answerLabel)
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func trueAudio() {
        presenter.trueAudio()
    }
}
