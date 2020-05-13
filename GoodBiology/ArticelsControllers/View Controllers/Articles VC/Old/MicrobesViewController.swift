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
import GoogleMobileAds

@available(iOS 13.0, *)
final class MicrobesViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var segmentedControlOutlet:   UISegmentedControl!
    @IBOutlet weak var textView:                 UITextView!
    
    @IBOutlet weak var notificationButtonOutlet: NotificationButton!
    
    // Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    @IBOutlet weak var stepperBackgroundView:    UIView!
    @IBOutlet weak var settingsButton:           UIBarButtonItem!
    @IBOutlet weak var switchTextView:           UITextView!
    @IBOutlet weak var switchView:               UIView!
    
    @IBOutlet weak var activityIndicator:        ArticleActivityIndicatorView!
    
    @IBOutlet weak var stepper:                  UIStepper!
    @IBOutlet weak var switchOutlet:             UISwitch!
    @IBOutlet weak var shareButton:              UIBarButtonItem!
    @IBOutlet weak var progressView:             UIProgressView!
    @IBOutlet weak var switchButton:             UIBarButtonItem!
    
    @IBOutlet weak var goToImagesButton: ImageButton!
    @IBOutlet weak var goToVideosButton: VideoButton!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        
        googleAdBannerView.adUnitID = "ca-app-pub-8702634561077907/9283193921"
        googleAdBannerView.rootViewController = self
        googleAdBannerView.load(GADRequest())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [segmentedControlOutlet ,notificationButtonOutlet]
        viewDidApearAnimationPreview(views as! [UIView], nil)
    }
    
    //MARK: Actions
    @IBAction func sharing(_ sender: Any) {
        guard let content = textView.text else { return }
        FastActivityVC.show(item: content, vc: self)
        shareButton.shareAudio()
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
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            textView.text = MicrobesArticleData.microbesMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 1:
            textView.text = MicrobesArticleData.microbesBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 2:
            textView.text = MicrobesArticleData.microbesStructureContent
            
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
    
    @IBAction func notificationButton(_ sender: NotificationButton) {
        PushNotifications.setupBasicNotification(body: "Microbes", inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
        notificationNamePost()
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
}

extension MicrobesViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        viewBasiscs()
        procesingInformationShowing()
    }
}

extension MicrobesViewController: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.microbesVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}

extension MicrobesViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.localizedDescription)")
    }
}

extension MicrobesViewController: ArticleViewControllerSetupViewPrtocol {
    func viewDidApearAnimationPreview(_ views: [UIView], _ bonusAnomation: (() -> Void)?) {
        UIView.animate(withDuration: 0.4) {
            for view in views {
                view.alpha = 1
            }
        }
    }
    
    func procesingInformationShowing() {
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
    }
}

extension MicrobesViewController {
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
        segmentedControlSetup()
        stepperViewPrefering()
        switchViewPrefering()
    }
    
    private func segmentedControlSetup() {
        segmentedControlOutlet.segmentedControlBasics()
        segmentedControlOutlet.segmentedControlShadow()
    }
    
    private func textViewSetup() {
        textView.mainTextViewTextColor(alpha: 0)
    }
    
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}
