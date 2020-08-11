//
//  NotificationsFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/18/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UserNotifications

//MARK: - PushNotifications Maneger
struct PushNotifications {
    
    //MARK: Setup Basic Words
    struct PushNotificationsBasicWords {
        static let basicNotificationHeader: String = "Will you be able to read something about "
        static let userAction = "User Action"
    }
    
    //MARK: Setup Notification
    static func setupBasicNotification(body: String, inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        
        ///Remove Notififications
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        let date = Date(timeIntervalSinceNow: seconds)
        
        ///Setup Content
        let content = UNMutableNotificationContent()
        content.title = "Let's Go !"
        content.body  = PushNotificationsBasicWords.basicNotificationHeader + body + "?"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = PushNotificationsBasicWords.userAction
        
        ///Setup Center
        let dateComponents: Set<Calendar.Component> = [.month, .day, .hour, .minute, .second]
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(dateComponents,
                                                 from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components,
                                                    repeats: false)
        let request = UNNotificationRequest(identifier: "MyUniqueIdentifier",
                                            content: content,
                                            trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        ///Setup delete action
        let actionIdentifier = "DeleteAction"
        let deleteActionTitle = "Delete"
        let deleteAction = UNNotificationAction(identifier: actionIdentifier,
                                                title: deleteActionTitle,
                                                options: [.destructive])
        let category = UNNotificationCategory(identifier: PushNotificationsBasicWords.userAction,
                                              actions: [deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        center.setNotificationCategories([category])
        center.add(request, withCompletionHandler: nil)
    }
}



//MARK: - Remove Notifications Function (Public Method)
public func removeNotifications(withIdentifiers identifiers: [String])   {
    let center = UNUserNotificationCenter.current()
    center.removePendingNotificationRequests(withIdentifiers: identifiers)
}

