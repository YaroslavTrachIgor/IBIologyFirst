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
        
        sender.flash()
    }
    
    private func trueShow() {
        answerLabel.text        = BasicTestWords.trueWord
        answerLabel.textColor   = .biologyGreenColor
        
        TestScores.shared.testScore += 10
    
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func trueAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1008))
    }
}
