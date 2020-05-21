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
        
        /// Animation
        sender.flash()
    }
    
    private func falseShow() {
        presenter.falseActionSetup(answerLabel: answerLabel)
        falseAndTrueButtonsForAnswersPrefering()
    }
    
    private func falseAudio() {
        presenter.falseAudio()
    }
}
