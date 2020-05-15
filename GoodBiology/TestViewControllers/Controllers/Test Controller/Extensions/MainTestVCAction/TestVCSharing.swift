//
//  TestVCSharing.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

//MARK: - Sharing
extension TestViewController {
    
    //MARK: - @IBAction
    @IBAction func sharing(_ sender: Any) {
        share()
        shareAudio()
    }
    
    
    //MARK: - Private
    private func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    private func share() {
        let string = navigationItem.title
        
        fastActivityVCforTest(item: string ?? .init())
    }
    
    private func fastActivityVCforTest(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
            
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
            
        present(activityVC, animated: true)
    }
}
