//
//  PlantsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import Social
import AudioToolbox

extension UIButton {
    func applyDesign() {
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.5
    }
}

class PlantsViewController: UIViewController {
    
    @IBOutlet weak var ViewMenuBackground: UIView!
    
    @IBAction func SearchButton(_ sender: Any) {
        
        if (ViewMenuBackground.isHidden == true) {
            
            ViewMenuBackground.isHidden = false
        } else {
            
            ViewMenuBackground.isHidden = true
        }
        
    }
    
    let letsread : String = "Do You Want To Read Something About "
    let Go : String = "Let's Go !"
    
    func ShareButtonsAudio() {
        
        AudioServicesPlayAlertSound(1006)
    }
    
    @IBOutlet weak var NotificationButtonOutlet: UIButton!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var ViewBackground: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            NotificationButtonOutlet.layer.shadowColor = UIColor.darkGray.cgColor
            NotificationButtonOutlet.layer.shadowRadius = 4
            NotificationButtonOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
            NotificationButtonOutlet.layer.shadowOpacity = 0.5
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    @IBAction func ShareButton(_ sender: Any) {
        
        let SelectServiceAlert = UIAlertController(title: "Select Service", message: "Select service", preferredStyle: .actionSheet)
        
        let FaceBookActionButton = UIAlertAction(title: "Facebook", style: .default) { (action) in
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)   {
                
                let facebookPostView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                
                facebookPostView?.setInitialText("Good Biology")
                
                self.present(facebookPostView!, animated: true, completion: nil)
                
            }   else    {
                
                self.attemp(serviceType: "Facebook")
            }
            
            self.ShareButtonsAudio()
        }
        
        let TwitterActionButton = UIAlertAction(title: "Twitter", style: .default) { (action) in
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)   {
                
                let twitterPostView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                twitterPostView?.setInitialText("Good Biology")
                
                self.present(twitterPostView!, animated: true, completion: nil)
                
            }   else    {
                
                self.attemp(serviceType: "Twitter")
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        SelectServiceAlert.addAction(FaceBookActionButton)
        SelectServiceAlert.addAction(TwitterActionButton)
        SelectServiceAlert.addAction(cancelButton)
        
        self.present(SelectServiceAlert, animated: true, completion: nil)
    }
    
    func attemp (serviceType: String) {
        
        let errorAlert = UIAlertController(title: "Unavalable", message: "Your Device Is Not Connected To \(serviceType)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        errorAlert.addAction(okAction)
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    
    func scheduleNotificatio(inSecond seconds: TimeInterval, completion: (Bool) -> ())
    {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        
        content.title = letsread + "Plants"
        content.body = Go
        
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
    
    func NotificationButtonAudio() {
        
        AudioServicesPlayAlertSound(SystemSoundID(1015))
    }
    
    @IBAction func NotificationButton(_ sender: UIButton)
    {
        
        scheduleNotificatio(inSecond: 240) { (success) in
            if success
            {
                print("We Send It")
            }
            else
            {
                print("Faied")
            }
        }
        
        sender.pulsate()
        
        NotificationButtonAudio()
        
    }
    
    @IBAction func Action(_ sender: Any) {
        
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    
    }
    
}
