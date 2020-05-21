//
//  TestVCDoneTest.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import SwiftEntryKit

//MARK: - Done Test
extension TestViewController {
    
    //MARK: @IBAction
    @IBAction func doneTest(_ sender: Any) {
        returnScore()
        endTestDone()
    }
    
    private func returnScore() {
        SwiftEntryKit.display(entry: DoneTestPopView.instanceFromNib(), using: EKAttributesManeger.setupDoneTestPopViewAttributes())
    }
    
    private func endTestDone() {
        TestScores.shared.testScore = 0
        TestScores.shared.doneButtonEnabled = false
        
        setDoneButtonEnabled()
    }
    
    private func setDoneButtonEnabled() {
        doneButton.isEnabled = TestScores.shared.doneButtonEnabled
    }
}
