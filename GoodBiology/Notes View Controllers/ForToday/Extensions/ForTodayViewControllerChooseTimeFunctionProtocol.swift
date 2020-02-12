//
//  ForTodayViewControllerChooseTimeFunctionProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

protocol ForTodayViewControllerChooseTimeFunctionProtocol {
    func timeButtonText()
    func dateViewShowingAudio()
    func pulsatingWhenDatePickNotHidden(_ sender: UIButton)
}

extension ForTodayViewController: ForTodayViewControllerChooseTimeFunctionProtocol {
    func pulsatingWhenDatePickNotHidden(_ sender: UIButton) {
        sender.pulsate(duration: 1)
    }
    
    func dateViewShowingAudio() {
        if dataPickerView.isHidden == true {
            AudioServicesPlayAlertSound(SystemSoundID(1003))
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1004))
        }
    }
    
    func timeButtonText() {
        if dataPickerView.isHidden == true {
            choseTimeButton.setTitle("Choose Date", for: .normal)
        } else {
            choseTimeButton.setTitle("Cancel", for: .normal)
        }
    }
    
    func chooseDateButtonPulsanting() {
        if dataPickerView.isHidden == false {
            choseTimeButton.pulsate()
        }
    }
}
