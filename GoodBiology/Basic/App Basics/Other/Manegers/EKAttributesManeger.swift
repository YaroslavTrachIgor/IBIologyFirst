//
//  EKAttributesManeger.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import SwiftEntryKit

//MARK: - EKAttributesManeger
final class EKAttributesManeger {
    static func setupNotificationViewEKAttributes() -> EKAttributes {
        var attributes = EKAttributes.topFloat
        attributes.displayDuration = .infinity
        attributes.shadow = .active(with: .init(color: .init(light: .biologyGreenColor,
                                                             dark: .biologyGreenColor),
                                                opacity: 20,
                                                radius: 15,
                                                offset: CGSize.zero))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = 10
        return attributes
    }
    
    static func setupDoneTestPopViewAttributes() -> EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.shadow = .active(with: .init(color: .init(light: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), dark: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), opacity: 20, radius: 15, offset: CGSize.zero))
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = 10
        attributes.entranceAnimation = .init(
        translate: .init(duration: 0.7,
                         anchorPosition: .bottom,
                         spring: .init(damping: 1,
                                       initialVelocity: 0)),
        scale: .init(from: 0.6,
                     to: 1,
                     duration: 0.2),
        fade: .init(from: 0.8,
                    to: 1,
                    duration: 0.3))
        
        return attributes
    }
}
