//
//  AlertsManeger.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import SwiftEntryKit

//MARK: - AlertsManeger main class
final class AlertsManeger {
    
    //MARK: Private
    private func setupDoneTestPopViewAttributes() -> EKAttributes {
        return EKAttributesManeger.setupNotificationViewEKAttributes()
    }
    
    
    //MARK: Public
    public func showNotificationView() {
        SwiftEntryKit.display(entry: NotificationView.instanceFromNib(), using: setupDoneTestPopViewAttributes())
    }
}
