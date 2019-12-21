//
//  ButtonsAnimations.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/23/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: Extension
extension UIButton {
    func pulsate(duration: Float) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration             = CFTimeInterval(duration)
        pulse.fromValue            = 0.95
        pulse.toValue              = 0.97
        pulse.autoreverses         = true
        pulse.repeatCount          = 1
        pulse.initialVelocity      = 0.6
        pulse.damping              = 0.1
        
        layer.add(pulse, forKey: nil)
        
        //MARK: Animation for articels buttons
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration             = 0.3
        pulse.fromValue            = 0.95
        pulse.toValue              = 1.0
        pulse.autoreverses         = true
        pulse.repeatCount          = 2
        pulse.initialVelocity      = 0.6
        pulse.damping              = 1.0
        
        layer.add(pulse, forKey: nil)
        
        //MARK: Animation for articels buttons
    }
}
