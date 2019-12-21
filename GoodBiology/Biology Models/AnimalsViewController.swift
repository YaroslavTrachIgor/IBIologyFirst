//
//  AnimalsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import Social
import AudioToolbox

class AnimalsViewController: UIViewController {

    func ShareButtonsAudio() {
        
        AudioServicesPlayAlertSound(1006)
    }
    
    let letsread = "Do You Want To Read Something About "
    
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
            
            self.ShareButtonsAudio()
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
    
    func scheduleNotificatio(inSecond seconds: TimeInterval, completion: (Bool) -> ())  {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        
        content.title = letsread + "Animals"
        content.body = "Let's Go !"
        
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(request, withCompletionHandler: nil)
        
    }
    
    deinit {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    }
    
    func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
        
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        
        
    }
    
    let LetsRead = "Let's read something aout"
    
    func NotificationButtonAudio() {
        
        AudioServicesPlayAlertSound(SystemSoundID(1015))
    }
    
    @IBAction func Animals(_ sender: UIButton)
    {
        scheduleNotificatio(inSecond: 7200) { (success) in
            if success {
                print("We Send It")
            }
            else    {
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
    
    @IBOutlet weak var NotificationOutletButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationOutletButton.layer.shadowColor = UIColor.darkGray.cgColor
        NotificationOutletButton.layer.shadowRadius = 4
        NotificationOutletButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        NotificationOutletButton.layer.shadowOpacity = 0.5
    }
    
}
