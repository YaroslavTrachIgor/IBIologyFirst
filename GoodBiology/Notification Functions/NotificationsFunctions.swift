//
//  NotificationsFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/18/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UserNotifications

public let basicNotificationHeader: String = "Will you be able to read something about "
public let userAction = "User Action"

func plantsScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content             = UNMutableNotificationContent()
        content.title       = "Let's Go !"
        content.body        = basicNotificationHeader + "Plants ?"
        content.sound       = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar        = Calendar(identifier: .gregorian)
    let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center          = UNUserNotificationCenter.current()
    let deleteAction    = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Plants")
}

func archaeaScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date            = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content         = UNMutableNotificationContent()
    
        content.title       = "Let's Go"
        content.body        = basicNotificationHeader + "Animals ?"
        content.sound       = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar        = Calendar(identifier: .gregorian)
    let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center          = UNUserNotificationCenter.current()
    let deleteAction    = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Archaea")
}

func animalsScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date            = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content         = UNMutableNotificationContent()
    
        content.title       = "Let's Go !"
        content.body        = basicNotificationHeader + "Animals ?"
        content.sound       = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar        = Calendar(identifier: .gregorian)
    let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center          = UNUserNotificationCenter.current()
    let deleteAction    = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Animals")
}

func virusesScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date            = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content         = UNMutableNotificationContent()
    
        content.title       = "Let's Go !"
        content.body        = basicNotificationHeader + "Viruses ?"
        content.sound       = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar        = Calendar(identifier: .gregorian)
    let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center          = UNUserNotificationCenter.current()
    let deleteAction    = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Viruses")
}

func manScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content = UNMutableNotificationContent()
    
        content.title           = "Let's Go !"
        content.body            = basicNotificationHeader + "Man ?"
        content.sound           = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar            = Calendar(identifier: .gregorian)
    let components          = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger             = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request             = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center              = UNUserNotificationCenter.current()
    let deleteAction        = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category            = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Man")
}

func microbesScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content = UNMutableNotificationContent()
    
        content.title           = "Let's Go !"
        content.body            = basicNotificationHeader + "Microbes ?"
        content.sound           = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar            = Calendar(identifier: .gregorian)
    let components          = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger             = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request             = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center              = UNUserNotificationCenter.current()
    let deleteAction        = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category            = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Microbes")
}

func mushroomsScheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
{
    removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    
    let date                = Date(timeIntervalSinceNow: seconds)
    print(Date())
    print(date)
    
    let content             = UNMutableNotificationContent()
    
        content.title           = "Let's Go !"
        content.body            = basicNotificationHeader + "Mushrooms ?"
        content.sound           = UNNotificationSound.default
        content.categoryIdentifier = userAction
    
    let calendar            = Calendar(identifier: .gregorian)
    let components          = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
    let trigger             = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request             = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
    let center              = UNUserNotificationCenter.current()
    let deleteAction        = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
    let category            = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
    
    center.setNotificationCategories([category])
    center.add(request, withCompletionHandler: nil)
    
    notificationPrinting(doing: "Mushrooms")
}

func removeNotifications(withIdentifiers identifiers: [String])   {
    let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
}
