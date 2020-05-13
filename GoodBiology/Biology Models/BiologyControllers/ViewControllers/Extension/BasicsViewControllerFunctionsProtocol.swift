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

protocol BasicsViewControllerFunctionsProtocol {
    func fastActivityVC(item: String)
    func shareAudio()
}

extension BasicsViewController: BasicsViewControllerFunctionsProtocol {
    func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
