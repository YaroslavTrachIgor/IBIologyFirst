//
//  FirstBiologyViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/15/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox

class FirstBiologyViewController: UIViewController {
   
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var basicsView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textDefaultView: UIButton!
    @IBOutlet weak var historyNotification: UIButton!
    @IBOutlet weak var historySecondNotification: UIButton!
    @IBOutlet weak var cellTheoryNotification: UIButton!
    @IBOutlet weak var evolutionNotification: UIButton!
    @IBOutlet weak var geneticsNotification: UIButton!
    @IBOutlet weak var structularNotification: UIButton!
    
    @IBAction func notification(_ sender: UIButton) {
        
        scheduleNotification(inSecond: 7200) { (success) in
            if success {
                print("We Send It")
            } else {
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
        
        content.title = "Let's read some about Biology."
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        basicsView.layer.shadowOpacity = 0.5
        basicsView.layer.shadowColor = UIColor.darkGray.cgColor
        basicsView.layer.shadowRadius = 11
        basicsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
    }

}
