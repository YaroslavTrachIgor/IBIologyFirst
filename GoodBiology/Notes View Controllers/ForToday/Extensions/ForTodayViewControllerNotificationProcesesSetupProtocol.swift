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
    func nothingNotificationSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ())
    func forTodayReminderSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ())
    func notificationAlertPrefering()
}

extension ForTodayViewController: ForTodayViewControllerNotificationProcesesSetupProtocol {
    func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func forTodayNotShow() {
        if inputTextField.text == "Nothing" {
            nothingNotificationSchedule(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText)
                } else {
                    print(failText)
                }
            }
        } else {
            forTodayReminderSchedule(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText)
                } else {
                    print(failText)
                }
            }
        }
        reminderOutletButton.settingTittleForNotificationButton()
        notificationAudio()
    }
    
    func notificationAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1002))
    }
    
    func nothingNotificationSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        let body: String = "Today, you sad - that you don't want anything to read"
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content             = UNMutableNotificationContent()
            content.title           = "Hey !"
            content.body            = body
            content.sound           = UNNotificationSound.default
            content.categoryIdentifier = userAction
        
        let calendar            = Calendar(identifier: .gregorian)
        let components          = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger             = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request             = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        let center              = UNUserNotificationCenter.current()
        let deleteAction        = UNNotificationAction(identifier: deleteWord, title: deleteWord, options: [.destructive])
        let category            = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        center.add(request, withCompletionHandler: nil)
    }
    
    func forTodayReminderSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
            print(Date())
            print(date)
        
        let header = "Let's Go"
        
        let content                         = UNMutableNotificationContent()
            content.title                   = header
            content.body                    = forTodayReminderBody
            content.sound                   = UNNotificationSound.default
            content.categoryIdentifier      = userAction
        
        let calendar        = Calendar(identifier: .gregorian)
        let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        let center          = UNUserNotificationCenter.current()
        let deleteAction    = UNNotificationAction(identifier: deleteWord, title: deleteWord, options: [.destructive])
        let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
            center.setNotificationCategories([category])
            center.add(request, withCompletionHandler: nil)
    }
    
    func notificationAlertPrefering() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
}
