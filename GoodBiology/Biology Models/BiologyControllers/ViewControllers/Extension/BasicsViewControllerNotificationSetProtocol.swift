//
//  BasicsViewControllerNotificationSetProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

protocol BasicsViewControllerNotificationSetProtocol {
    func scheduleNotification()
    func removeNotification(identifiers: [String])
}


// MARK: - BasicsViewControllerNotificationSetProtocol
extension BiologyViewController: BasicsViewControllerNotificationSetProtocol {
    func scheduleNotification() {
        PushNotifications.setupBasicNotification(body: PushNotifications.PushNotificationsBasicWords.basicNotificationHeader + "\(title!) of Biolofy", inSecond: TimeInterval(timeInterval)) { (success) in
            if success {
                print(congratsText) } else {
                print(failText)
            }
        }
        notificationButton.notificationButtonAudio()
        notificationButton.settingTittleForNotificationButton()
    }
    
    func removeNotification(identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}
