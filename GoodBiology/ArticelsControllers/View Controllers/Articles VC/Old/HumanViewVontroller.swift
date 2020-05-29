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
final class HumanViewVontroller: UIViewController {
    
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
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        let views = [notificationuttonOutlet, segmentedControl]
        viewDidApearAnimationPreview(views as! [UIView], nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}



//MARK: - @IBActions
extension HumanViewVontroller {
    @IBAction func sharing(_ sender: Any) {
        guard let content = textView.text else { return }
        FastActivityVC.show(item: content, vc: self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
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
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: articleName)
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
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
    @IBAction func notificationButton(_ sender: NotificationButton) {
        /// For Analytics
        AnalyticsManeger.addNotificationAnalytics(article: articleName)
        
        /// Push Notification
        notificationNamePost()
        PushNotifications.setupBasicNotification(body: articleName, inSecond: TimeInterval(BasicPushNotificationAttributes.timeInterval)) { (success) in
            if success { print(BasicPushNotificationAttributes.congratsText) } else { print(BasicPushNotificationAttributes.failText) }
        }
        
        /// UI animations
        let alertsManeger = AlertsManeger()
        alertsManeger.showNotificationView()
        sender.notificationButtonBasicFunctions(view)
    }

    @IBAction func segmentedControAction(_ sender: UISegmentedControl) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
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
}



//MARK: - ArticlesViewControllerDelegate
extension HumanViewVontroller: ArticlesViewControllerDelegate {
    var articleName: String { get { return "Human" } }
    
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
    }
}



//MARK: - ArticlesVCconnectionProtocol
extension HumanViewVontroller: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.humanVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}



//MARK: - ArticleViewControllerSetupViewPrtocol
extension HumanViewVontroller: ArticleViewControllerSetupViewPrtocol {
    func viewDidApearAnimationPreview(_ views: [UIView], _ bonusAnomation: (() -> Void)?) {
        UIView.animate(withDuration: 0.4) {
            for view in views {
                view.alpha = 1
            }
        }
    }
    
    func procesingInformationShowing() {
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
    }
}



//MARK: - Main Functions
extension HumanViewVontroller {
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
}
