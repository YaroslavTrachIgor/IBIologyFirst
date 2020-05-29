//
//  BasicsViewControllerFunctionsProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import Signals

//MARK: - BasicsViewControllerFunctionsProtocol protocol
protocol BasicsViewControllerFunctionsProtocol {
    func fastActivityVC(item: String)
    func shareAudio()
}


//MARK: - BasicsViewControllerFunctionsProtocol extension
extension BiologyViewController: BasicsViewControllerFunctionsProtocol {
    func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
