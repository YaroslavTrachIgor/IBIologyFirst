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

extension BasicsViewController: BasicsViewControllerNotificationSetProtocol {
    func scheduleNotification() {
        if navigationItem.title == "Basics" {
            basicsScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "History" {
            historyScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "History p. 2" {
            historyPTwoScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Cell Theory" {
            cellTheotyScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Evolution" {
            evolutionScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Genetics" {
            geneticsScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Structular" {
            structularScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
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
