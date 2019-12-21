//
//  PlantsTable.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/2/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox

class PlantsTable: UITableView {

    @IBOutlet weak var BasicsTextView: UITextView!
    
    @IBAction func notificationButtons(_ sender: Any) {
        
        scheduleNotificatio(inSecond: 2) { (success) in
            if success {
                
                print("We Send It")
            } else {
                
                print("Faied")
            }
        }
    }
    
    func scheduleNotificatio(inSecond seconds: TimeInterval, completion: (Bool) -> ())
    {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        
        content.title = "Let's Read Some Biology Articels"
        content.body = "Let's Go"
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
        // Drawing code

    }
    
}
