//
//  ForTodayViewControllerNotificationProcesesSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import AudioToolbox

protocol ForTodayViewControllerNotificationProcesesSetupProtocol {
    func removeNotifications(withIdentifiers identifiers: [String])
    func forTodayNotShow()
    func notificationAudio()
    func notificationAlertPrefering()
}

extension ForTodayViewController: ForTodayViewControllerNotificationProcesesSetupProtocol {
    func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func forTodayNotShow() {
        if inputTextField.text != "Nothing" {
            PushNotifications.setupBasicNotification(body: "Hey, today you wanted to read \(inputTextField.text!)", inSecond: TimeInterval(timeInterval)) { (success) in
                    if success {
                        print(congratsText)
                    } else {
                        print(failText)
                    }
            }
            reminderOutletButton.settingTittleForNotificationButton()
            notificationAudio()
        }
    }
    
    func notificationAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1002))
    }
    
    func notificationAlertPrefering() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
}
