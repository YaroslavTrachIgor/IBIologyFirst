//
//  NotificationCenterViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let l = "Let's read something about"
    
    @IBAction func Plants(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Plants"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5184000, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Animals(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Animals"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 518400, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Man(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Man"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5184000, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Mushrooms(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Mushrooms"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 518400, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Microbes(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Mycrobes"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 518400, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Archea(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Archaea"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 518400, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func Virus(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        
        content.title = l + " Viruses"
        content.body = "Let's Go"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 518400, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
