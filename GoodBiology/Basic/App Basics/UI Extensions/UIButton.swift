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
    
    //MARK: - Setup Audio
    public func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    public func notificationButtonAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1002))
    }
    
    //MARK: - Setup NotificationButtons
    public func settingTittleForNotificationButton() {
        
        ///Setup title and titleColor
        self.setTitle("Notification was put", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.setTitle("Put a notification", for: .normal)
        }
    }
    
    // Basics for diffrent buttons
    public func notificationButtonBasics() {
        
        ///Setup backgroundColor
        backgroundColor    = .biologyGreenColor
        
        ///Setup corners
        layer.cornerRadius = 10
        
        ///Setup border
        layer.borderColor = #colorLiteral(red: 0.01702673263, green: 0.2744213042, blue: 0.09773741148, alpha: 1)
        layer.borderWidth = 3
        
        ///Setup titleColor
        setTitleColor(.white, for: .normal)
        
        ///Setup alpha
        alpha = 0
        
        /// Set Shadow
        buttonsShadows()
    }
    
    
    //MARK: - Setup ImageButton
    public func imageButton() {
        
        ///Setup Basics
        notificationButtonBasics()
        shareAudio()
        
        ///Setup corners
        layer.cornerRadius = 18
    
        ///Setup fpnt
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 21)
        
        ///Setup alpha and hidden
        alpha    = 1
        isHidden = true
        
        ///Setup title
        setTitle("Images", for: .normal)
    }
    
    
    //MARK: - Setup VideoButton
    public func videoButton() {
        imageButton()
        
        ///Setup title
        setTitle("Videos", for: .normal)
    }
    
    /// Use this Method to make costomButton Quickly
    /// - Parameters:
    ///   - background: backgroundColor
    ///   - titleColor: setTitleColor
    ///   - title: setTitle
    ///   - corner: layer.cornerRadius
    ///   - borderWidth: layer.borderWidth
    public func fastButtonCostomizing(background: UIColor, titleColor: UIColor, title: String, corner: Float, borderWidth: Float) {
        
        ///Setup backgroundColor
        backgroundColor = background
        
        ///Setup corners
        layer.cornerRadius = CGFloat(corner)
        
        ///Setup title and titleColor
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        
        ///Setup borders
        layer.borderWidth  = CGFloat(borderWidth)
        layer.borderColor  = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        
        ///Setup shadows
        buttonsShadows()
    }
}
