//
//  ManViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/6/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox
import Social

@available(iOS 13.0, *)
class HumanViewVontroller: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var notificationuttonOutlet:  NotificationButton!
    
    @IBOutlet weak var headlineItem:             UINavigationItem!
    @IBOutlet weak var settings:                 UIBarButtonItem!
    @IBOutlet weak var stepperBackgroundView:    UIView!
    @IBOutlet weak var `switch`:                 UISwitch!
    @IBOutlet weak var switchTextView:           UITextView!
    @IBOutlet weak var switchView:               UIView!
    @IBOutlet weak var settingsOutlet:           UIBarButtonItem!
    
    @IBOutlet weak var activityIndicator:        ArticleActivityIndicatorView!
    
    @IBOutlet weak var stepper:                  UIStepper!
    @IBOutlet weak var switchOutlet:             UISwitch!
    @IBOutlet weak var shareButton:              UIBarButtonItem!
    @IBOutlet weak var progressView:             UIProgressView!
    @IBOutlet weak var switchButton:             UIBarButtonItem!
    @IBOutlet weak var textView:                 UITextView!
    @IBOutlet weak var segmentedControl:         UISegmentedControl!
    
    @IBOutlet weak var goToImagesButton: ImageButton!
    @IBOutlet weak var goToVideosButton: VideoButton!
    
    //MARK: Actions
    @IBAction func sharing(_ sender: Any) {
        guard let content = textView.text else { return }
        fastActivityVC(item: content)
        shareButton.shareAudio()
    }
    
    private func fastActivityVC(item: String) {
        
        //Alert
        let alert = UIAlertController(title: "Share", message: nil, preferredStyle: .actionSheet)
            alert.view.tintColor = lazyColor
        let basicShare = UIAlertAction(title: "Basic Share", style: .default) { (action) in
            let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
                UIApplication.shared.keyWindow?.tintColor = lazyColor
            
            self.present(activityVC, animated: true, completion: nil)
        }
        
        let actionFacebook = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            self.shareButton.shareAudio()
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText(HumanArticleData.manMostContent)
                post.add(UIImage(named: "realGoodbiologyIcon-1.jpg"))
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Facebook")
            }
        }
        
        //Second action
        let actionTwitter = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            self.shareButton.shareAudio()
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText(HumanArticleData.manMostContent)
                post.add(UIImage(named: "realGoodbiologyIcon-1.jpg"))
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Twitter")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(basicShare)
        alert.addAction(actionFacebook)
        alert.addAction(actionTwitter)
        alert.addAction(cancel)
        alert.setTitle(font: UIFont(name: "AvenirNext-Medium", size: 14), color: .lightGray)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showAlert(service: String) {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
                alert.addAction(action)
                alert.view.tintColor = lazyColor
        
        present(alert, animated: true, completion: nil)
        
        self.shareButton.shareAudio()
    }
    
    @IBAction func editButton(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn == true {
            textView.isEditable                 = true
            segmentedControl.isHidden           = false
            notificationuttonOutlet.isHidden    = false
            settingsOutlet.isEnabled            = true
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            textView.isEditable                 = false
            segmentedControl.isHidden           = true
            notificationuttonOutlet.isHidden    = true
            settingsOutlet.isEnabled            = false
            shareButton.isEnabled               = false
            switchTextView.text                 = "Show diffrent functions"
            stepperBackgroundView.isHidden      = true
        }
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        if (stepperBackgroundView.isHidden == true) {
            stepperBackgroundView.isHidden  = false
            
            shareButton.isEnabled           = false
            switchButton.isEnabled          = false
        } else {
            stepperBackgroundView.isHidden  = true
            
            shareButton.isEnabled           = true
            switchButton.isEnabled          = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font =  textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func notificationButton(_ sender: NotificationButton) {
        manScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: Actions
    @IBAction func segmentedControAction(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textView.text = HumanArticleData.manMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 1:
            textView.text = HumanArticleData.manBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 2:
            textView.text = HumanArticleData.manStructureContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 3:
            textView.text = ""
            
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
        default:
            print("Error")
        }
    }
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.notificationuttonOutlet.alpha   = 1
            self.segmentedControl.alpha          = 1
        }
    }
    
    private func stepperViewPrefering() {
        stepper.stepperBaics()
        stepperBackgroundView.editorsViews()
        stepper.stepperShadow()
    }
    
    private func switchViewPrefering() {
        switchOutlet.switchBasics()
        switchTextView.textViewShadow()
        switchTextView.switchTextViewPrefering()
        switchView.editorsViews()
        switchTextView.mainTextViewTextColor(alpha: 1)
    }
    
    private func viewBasics() {
        segmentedControlSetup()
        textViewSetup()
        stepperViewPrefering()
        switchViewPrefering()
    }
    
    private func segmentedControlSetup() {
        segmentedControl.segmentedControlBasics()
        segmentedControl.segmentedControlShadow()
    }
    
    private func textViewSetup() {
        textView.mainTextViewTextColor(alpha: 0)
    }
    
    private func procesingInformationShowing() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.textView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
        }
        
        progressView.setProgress(0, animated: true)
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.startProgress()
            } else {
                self.activityIndicator.activityIndicatorStop()
                self.textView.mainTextViewTextColor(alpha: 1)
                self.progressView.stopProgress()
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        viewDidLoadPrinting(doing: "Man")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
}

@available(iOS 13.0, *)
extension HumanViewVontroller: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
    }
}
