//
//  AnimalsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/6/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox
import Social
import GoogleMobileAds

@available(iOS 13.0, *)
final class AnimalsViewController: UIViewController {
    
    //MARK: IBOutlets
    // Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    @IBOutlet weak var headlineItem:             UINavigationItem!
    
    @IBOutlet weak var notificationButtonOutlet: NotificationButton!
    
    @IBOutlet weak var stepperBackgroundView: UIView!
    @IBOutlet weak var switchView:            UIView!
    @IBOutlet weak var switchTextView:        UITextView!
    @IBOutlet weak var settingsButton:        UIBarButtonItem!
    
    @IBOutlet weak var activityIndicator: ArticleActivityIndicatorView!
    
    @IBOutlet weak var stepper:         UIStepper!
    @IBOutlet weak var switchOutlet:    UISwitch!
    @IBOutlet weak var stepperOutlet:   UIStepper!
    @IBOutlet weak var shareButton:     UIBarButtonItem!
    @IBOutlet weak var progressView:    UIProgressView!
    @IBOutlet weak var switchButton:    UIBarButtonItem!
    @IBOutlet weak var textView:        UITextView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var goToImagesButton: ImageButton!
    @IBOutlet weak var goToVideosButton: VideoButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        
        googleAdBannerView.adUnitID = "ca-app-pub-8702634561077907/9283193921"
        googleAdBannerView.rootViewController = self
        googleAdBannerView.load(GADRequest())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [notificationButtonOutlet, segmentedControl]
        viewDidApearAnimationPreview(views as! [UIView], nil)
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}



//MARK: - @IBActions
extension AnimalsViewController {
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
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            textView.isEditable                 = true
            segmentedControl.isHidden           = false
            notificationButtonOutlet.isHidden   = false
            settingsButton.isEnabled            = true
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            textView.isEditable                 = false
            segmentedControl.isHidden           = true
            notificationButtonOutlet.isHidden   = true
            settingsButton.isEnabled            = false
            shareButton.isEnabled               = false
            switchTextView.text                 = "Show diffrent functions"
            stepperBackgroundView.isHidden      = true
        }
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: articleName)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font =  textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
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
    
    @IBAction func notificationButton(_ sender: NotificationButton) {
        AnalyticsManeger.addNotificationAnalytics(article: articleName)
        PushNotifications.setupBasicNotification(body: articleName, inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
        notificationNamePost()
    }
    
    //MARK: Actions
    @IBAction func segmentedControl(_ sender: Any) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textView.text = AnimalsArticleData.animalsMostContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 1:
            textView.text = AnimalsArticleData.animalsBasicsContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 2:
            textView.text = AnimalsArticleData.animalsStructureContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 3:
            textView.text = ""
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
        default:
            print ("Error")
        }
    }
}



//MARK: - ArticlesViewControllerDelegate
extension AnimalsViewController: ArticlesViewControllerDelegate {
    var articleName: String { get { return "Animals" } }
    
    func finalView() {
        view.viewGradient()
        
        viewBaiscs()
        procesingInformationShowing()
    }
}



//MARK: - ArticlesVCconnectionProtocol
extension AnimalsViewController: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.animalsVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}




extension AnimalsViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.localizedDescription)")
    }
}



//MARK: - ArticleViewControllerSetupViewPrtocol
extension AnimalsViewController: ArticleViewControllerSetupViewPrtocol {
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
                self.activityIndicator.stopAnimating()
                self.textView.mainTextViewTextColor(alpha: 1)
                self.progressView.stopProgress()
            }
        }
    }
}



//MARK: - Main Functions
extension AnimalsViewController {
    private func stepperViewPrefering() {
        stepper.stepperBaics()
        stepperBackgroundView.editorsViews()
        stepper.viewShadows()
        stepperOutlet.stepperShadow()
    }
    
    private func switchViewPrefering() {
        switchTextView.switchTextViewPrefering()
        switchOutlet.switchBasics()
        switchTextView.textViewShadow()
        switchView.editorsViews()
        switchTextView.mainTextViewTextColor(alpha: 1)
    }
    
    private func viewBaiscs() {
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
