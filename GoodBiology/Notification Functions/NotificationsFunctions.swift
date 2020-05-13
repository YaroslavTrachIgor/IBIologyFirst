//
//  NotificationsFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/18/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UserNotifications

struct PushNotifications {
    struct PushNotificationsBasicWords {
        static let basicNotificationHeader: String = "Will you be able to read something about "
        static let userAction = "User Action"
    }
    
    static func setupBasicNotification(body: String, inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        content.title = "Let's Go !"
        content.body  = PushNotificationsBasicWords.basicNotificationHeader + body + "?"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = PushNotificationsBasicWords.userAction
        
        let calendar        = Calendar(identifier: .gregorian)
        let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        let center          = UNUserNotificationCenter.current()
        let deleteAction    = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category        = UNNotificationCategory(identifier: PushNotificationsBasicWords.userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        center.add(request, withCompletionHandler: nil)
    }
}

func removeNotifications(withIdentifiers identifiers: [String])   {
    let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
}
