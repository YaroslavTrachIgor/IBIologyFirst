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

// MARK: - BasicsViewControllerNotificationSetProtocol protocol
protocol BasicsViewControllerNotificationSetProtocol {
    func scheduleNotification()
    func removeNotification(identifiers: [String])
}



// MARK: - BasicsViewControllerNotificationSetProtocol extension
extension BiologyViewController: BasicsViewControllerNotificationSetProtocol {
    func scheduleNotification() {
        PushNotifications.setupBasicNotification(body: PushNotifications.PushNotificationsBasicWords.basicNotificationHeader + "\(title!) of Biolofy", inSecond: TimeInterval(BasicPushNotificationAttributes.timeInterval)) { (success) in
            if success {
                print(BasicPushNotificationAttributes.congratsText)
            } else {
                print(BasicPushNotificationAttributes.failText)
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
