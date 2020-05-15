//
//  TestVCFalseAction.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: - Setup - False Action
extension TestViewController {
    @IBAction func falseButton(_ sender: UIButton) {
        falseShow()
        falseAudio()
        
        sender.flash()
    }
    
    private func falseShow() {
        answerLabel.text        = BasicTestWords.falseWord
        answerLabel.textColor   = falseTint
        
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func falseAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1009))
    }
}
