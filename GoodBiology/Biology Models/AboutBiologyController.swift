//
//  AboutBiologyController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/4/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox

class AboutBiologyController: UITableView {
    
    @IBAction func notificationButton(_ sender: UIButton) {
        
        scheduleNotification(inSecond: 7200) { (success) in
            if success {
                print("We Send It")
            }
            else    {
                print("Faied")
            }
        }
        
        sender.pulsate()
        
        AudioServicesPlayAlertSound(SystemSoundID(1010))
    }
    
    func scheduleNotification(inSecond seconds: TimeInterval, completion: (Bool) -> ())
    {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        
        content.title = "Let's read what you planned."
        content.body = "Let's Go !"
        
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(request, withCompletionHandler: nil)
        
    }
    
    deinit
    {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    }
    
    func removeNotifications(withIdentifiers identifiers: [String])   {
        
        let center = UNUserNotificationCenter.current()
        
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
