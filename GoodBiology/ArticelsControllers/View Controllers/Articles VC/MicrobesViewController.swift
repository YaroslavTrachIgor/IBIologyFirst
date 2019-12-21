//
//  MicrobesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/6/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox
import UserNotifications
import Social

class MicrobesViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var segmentedControlOutlet:   UISegmentedControl!
    @IBOutlet weak var textView:                 UITextView!
    @IBOutlet weak var notificationButtonOutlet: UIButton!
    @IBOutlet weak var stepperBackgroundView:    UIView!
    @IBOutlet weak var settingsButton:           UIBarButtonItem!
    @IBOutlet weak var switchTextView:           UITextView!
    @IBOutlet weak var switchView:               UIView!
    @IBOutlet weak var activityIndicator:        UIActivityIndicatorView!
    @IBOutlet weak var stepper:                  UIStepper!
    @IBOutlet weak var switchOutlet:             UISwitch!
    @IBOutlet weak var shareButton:              UIBarButtonItem!
    @IBOutlet weak var progressView:             UIProgressView!
    @IBOutlet weak var switchButton:             UIBarButtonItem!
    
    @IBOutlet weak var goToImagesButton: UIButton!
    @IBOutlet weak var goToVideosButton: UIButton!
    
    //MARK: Actions
    @IBAction func sharing(_ sender: Any) {
        if textView.text == microbesBasicsContent {
            fastActivityVC(item: microbesBasicsContent)
            
        } else if textView.text == microbesStructureContent {
            fastActivityVC(item: microbesStructureContent)
            
        } else {
            fastActivityVC(item: microbesMostContent)
        }
        shareButton.shareAudio()
    }
    
    private func imageButtonPrefering() {
        goToImagesButton.imageButton()
    }
    
    private func videosButtonPrefering() {
        goToVideosButton.videoButton()
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
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText(microbesMostContent)
                post.add(UIImage(named: "realGoodbiologyIcon-1.jpg"))
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Facebook")
            }
        }
        
        //Second action
        let actionTwitter = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText(microbesMostContent)
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
        alert.view.tintColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            textView.isEditable                 = true
            segmentedControlOutlet.isHidden     = false
            notificationButtonOutlet.isHidden   = false
            settingsButton.isEnabled            = true
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            textView.isEditable                 = false
            segmentedControlOutlet.isHidden     = true
            notificationButtonOutlet.isHidden   = true
            settingsButton.isEnabled            = false
            shareButton.isEnabled               = false
            switchTextView.text                 = "Show diffrent functions"
            stepperBackgroundView.isHidden      = true
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        if switchView.isHidden == false {
            switchView.isHidden = true
        } else {
            switchView.isHidden = false
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font =  textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func settings(_ sender: Any) {
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
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            textView.text = microbesMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 1:
            textView.text = microbesBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 2:
            textView.text = microbesStructureContent
            
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
    
    @IBAction func notificationButton(_ sender: UIButton) {
        microbesScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        
        notificationButtonOutlet.notificationButtonAudio()
        notificationButtonOutlet.settingTittleForNotificationButton()
        
        for _ in 0..<2 {
            sender.pulsate()
        }
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: LifeCycle    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.notificationButtonOutlet.alpha  = 1
            self.segmentedControlOutlet.alpha    = 1
        }
    }
    
    private func stepperViewPrefering() {
        stepper.stepperShadow()
        stepperBackgroundView.editorsViews()
        stepper.stepperBaics()
    }
    
    private func switchViewPrefering() {
        switchTextView.switchTextViewPrefering()
        switchTextView.textViewShadow()
        switchView.editorsViews()
        switchOutlet.switchBasics()
        switchTextView.mainTextViewTextColor(alpha: 1)
    }
    
    private func viewBasiscs() {
        textViewSetup()
        activityIndicatorSetup()
        notificationButtonOutletSetup()
        segmentedControlSetup()
        stepperViewPrefering()
        switchViewPrefering()
        imageButtonPrefering()
        videosButtonPrefering()
    }
    
    private func segmentedControlSetup() {
        segmentedControlOutlet.segmentedControlBasics()
        segmentedControlOutlet.segmentedControlShadow()
    }
    
    private func notificationButtonOutletSetup() {
        notificationButtonOutlet.buttonsShadows()
        notificationButtonOutlet.notificationButtonBasics()
    }
    
    private func activityIndicatorSetup() {
        activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
    
    private func textViewSetup() {
        textView.mainTextViewTextColor(alpha: 0)
    }
    
    private func procesingInformationShowing() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.textView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
        }
        
        progressView.basicProgress()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.progressView.progress   != 1 {
                self.progressView.startProgress()
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.mainTextViewTextColor(alpha: 1)
                self.progressView.stopProgress()
                
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        
        viewDidLoadPrinting(doing: "Microbes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
}

extension MicrobesViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        viewBasiscs()
        procesingInformationShowing()
    }
}
