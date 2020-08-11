//
//  ArchaeaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/5/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox
import Social

@available(iOS 13.0, *)
final class ArchaeaViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var headline:     UINavigationItem!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var notificationButton:    NotificationButton!
    
    @IBOutlet weak var stepperBackgroundView: UIView!
    @IBOutlet weak var switchTextView:        UITextView!
    @IBOutlet weak var switchView:            UIView!
    @IBOutlet weak var settingsOutlet:        UIBarButtonItem!
    
    @IBOutlet weak var activityIndicator:     ArticleActivityIndicatorView!
    
    @IBOutlet weak var textView:             UITextView!
    @IBOutlet weak var stepper:              UIStepper!
    @IBOutlet weak var switchOutlet:         UISwitch!
    @IBOutlet weak var shareButton:          UIBarButtonItem!
    @IBOutlet weak var switchButton:         UIBarButtonItem!
    @IBOutlet weak var basicsTextView:       UITextView!
    @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    
    @IBOutlet weak var goToImagesButton:      ImageButton!
    @IBOutlet weak var goToVideosButton:      VideoButton!
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        let views = [notificationButton, segmentControlOutlet]
        viewDidApearAnimationPreview(views as! [UIView], nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setTabBarHidden(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        setTabBarHidden(false)
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}



//MARK: - @IBActions
extension ArchaeaViewController {
    @IBAction func sharing(_ sender: Any) {
        guard let content = textView.text else { return }
        FastActivityVC.show(item: content, vc: self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
    }
    
    @IBAction func editSiwtchButton(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            textView.isEditable             = true
            textView.isSelectable           = false
            segmentControlOutlet.isHidden   = false
            notificationButton.isHidden     = false
            settingsOutlet.isEnabled        = true
            shareButton.isEnabled           = true
            switchTextView.text             = "Hide  diffrent functions"
        } else {
            textView.isEditable             = false
            segmentControlOutlet.isHidden   = true
            notificationButton.isHidden     = true
            settingsOutlet.isEnabled        = false
            shareButton.isEnabled           = false
            stepperBackgroundView.isHidden  = true
            switchTextView.text             = "Show diffrent functions"
            stepperBackgroundView.isHidden  = true
        }
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: articleName)
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        if (stepperBackgroundView.isHidden == true) {
            stepperBackgroundView.isHidden  = false
            
            shareButton.isEnabled  = false
            switchButton.isEnabled = false
        } else {
            stepperBackgroundView.isHidden  = true
            
            shareButton.isEnabled  = true
            switchButton.isEnabled = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font            =  basicsTextView.font?.fontName
        let fontSize        = CGFloat(sender.value)
        
        basicsTextView.font = UIFont(name: font!, size: fontSize)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
    //MARK: Actions
    @IBAction func segmentedControl(_ sender: Any) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch  segmentControlOutlet.selectedSegmentIndex {
        case 0:
            basicsTextView.text = ArchaeaArticleData.archaeaMostContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButton.isHidden = false
        case 1:
            basicsTextView.text = ArchaeaArticleData.archaeaBasicsContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButton.isHidden = false
        case 2:
            basicsTextView.text = ArchaeaArticleData.archaeaStructureContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButton.isHidden = false
        case 3:
            basicsTextView.text = ""
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
            
            notificationButton.isHidden = true
        default:
            print(" Error ")
        }
    }
    
    //MARK: Actions
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
}



//MARK: - ArticlesViewControllerDelegate
extension ArchaeaViewController: ArticlesViewControllerDelegate {
    var articleName: String { get { return "Archaea" } }
    
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
    }
}


//MARK: - ArticlesVCconnectionProtocol
extension ArchaeaViewController: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.archaeaVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}



//MARK: - ArticleViewControllerSetupViewPrtocol
extension ArchaeaViewController: ArticleViewControllerSetupViewPrtocol {
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
        
        progressView.basicProgress()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.startProgress()
            } else {
                self.activityIndicator.activityIndicatorStop()
                self.basicsTextView.mainTextViewTextColor(alpha: 1)
                self.progressView.stopProgress()
            }
        }
    }
}



//MARK: - Main Functions
extension ArchaeaViewController {
    private func stepperViewPrefering() {
        stepper.stepperBaics()
        stepperBackgroundView.viewShadows()
        stepperBackgroundView.editorsViews()
    }
    
    private func switchViewPrefering() {
        switchTextView.switchTextViewPrefering()
        switchOutlet.switchBasics()
        switchTextView.textViewShadow()
        switchView.editorsViews()
        switchTextView.mainTextViewTextColor(alpha: 1)
    }
    
    private func viewBasics() {
        segmentControlOutletSetup()
        textViewSetup()
        stepperViewPrefering()
        switchViewPrefering()
    }
    
    private func segmentControlOutletSetup() {
        segmentControlOutlet.segmentedControlShadow()
        segmentControlOutlet.segmentedControlBasics()
    }
    
    private func textViewSetup() {
        textView.mainTextViewTextColor(alpha: 0)
    }
}
