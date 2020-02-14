//
//  UIButton.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension UIButton {
    public func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    public func notificationButtonAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1002))
    }
    
    public func settingTittleForNotificationButton() {
        self.setTitle("Notification was put", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.setTitle("Put a notification", for: .normal)
        }
    }
    
    // Basics for diffrent buttons
    public func notificationButtonBasics() {
        self.backgroundColor    = #colorLiteral(red: 0.02729533613, green: 0.3659711778, blue: 0.133120358, alpha: 1)
        self.layer.borderColor  = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        self.layer.borderWidth  = 3.07
        self.layer.cornerRadius = 14.7
        
        self.setTitleColor(.white, for: .normal)
        
        self.buttonsShadows()
        
        self.alpha = 0
    }
    
    public func imageButton() {
        self.notificationButtonBasics()
        self.shareAudio()
        
        self.layer.cornerRadius = 18
        
        self.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 21)
        
        self.alpha    = 1
        self.isHidden = true
        self.setTitle("Images", for: .normal)
    }
    
    public func videoButton() {
        self.imageButton()
        
        self.setTitle("Videos", for: .normal)
    }
    
    public func fastButtonCostomizing(background: UIColor, titleColor: UIColor, title: String, corner: Float, borderWidth: Float) {
        self.backgroundColor    = background
        self.layer.cornerRadius = CGFloat(corner)
        
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        
        self.layer.borderWidth  = CGFloat(borderWidth)
        self.layer.borderColor  = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        
        self.buttonsShadows()
    }
}
