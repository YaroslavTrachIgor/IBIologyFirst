//
//  PlantsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/5/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox
import Social
import Combine
import GoogleMobileAds

@available(iOS 13.0, *)
final class PlantsViewController: UIViewController {
    
    // Google ADMob Banner
    var interstitial: GADInterstitial!
    
    //MARK: IBOutlets
    @IBOutlet weak var headLine: UINavigationItem!
    
    @IBOutlet weak var notificationButtonOutlet: NotificationButton!
    
    @IBOutlet weak var capitalView:    UIView!
    @IBOutlet weak var stepperView:    UIView!
    @IBOutlet weak var switchView:     UIView!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var switchTextView: UITextView!
    @IBOutlet weak var `switch`:       UISwitch!
    
    @IBOutlet weak var activityIndicator: ArticleActivityIndicatorView!
    
    @IBOutlet weak var someMoreView: SomeMoreView!
    
    @IBOutlet weak var stepper:         UIStepper!
    @IBOutlet weak var switchOutlet:    UISwitch!
    @IBOutlet weak var shareButton:     UIBarButtonItem!
    @IBOutlet weak var progressView:    UIProgressView!
    @IBOutlet weak var switchButton:    UIBarButtonItem!
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var goToImagesButton: ImageButton!
    @IBOutlet weak var goToVideosButton: VideoButton!
    
    @IBOutlet weak var basicsTextView: UITextView!
    
    @IBOutlet weak var segmentedControlOutlet:UISegmentedControl!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        
        /// Google Add Banner
        setupBanner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidApearAnimation()
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
}



//MARK: - @IBActions
extension PlantsViewController {
    @IBAction func hideSomeMoreView(_ sender: Any) {
        someMoreView.isHidden = true
    }
    
    @IBAction func cleakHear(_ sender: Any) {
        showBunner()
    }
    

    @IBAction func editButton(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: switchView, main: view, nil)
    }
    
    @IBAction func sharing(_ sender: Any) {
        guard let content = basicsTextView.text else { return }
        FastActivityVC.show(item: content, vc: self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        let isOn = sender.isOn
        
        basicsTextView.isEditable           = isOn
        basicsTextView.isEditable           = isOn
        basicsTextView.isSelectable         = isOn
        shareButton.isEnabled               = isOn
        settingsButton.isEnabled            = isOn
        segmentedControlOutlet.isHidden     = !isOn
        segmentedControlOutlet.isHidden     = !isOn
        notificationButtonOutlet.isHidden   = !isOn
        switchTextView.text                 = isOn == true ? "Hide  diffrent functions" : "Show diffrent functions"
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: articleName)
    }
    
    @IBAction func settingsButtonAction(_ sender: UIBarButtonItem) {
        stepperView.isHidden    = stepperView.isHidden == true ? false : true
        shareButton.isEnabled   = stepperView.isHidden == true ? true : false
        switchButton.isEnabled  = stepperView.isHidden == true ? true : false
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font     = basicsTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        basicsTextView.font = UIFont(name: font!, size: fontSize)
        
        UIView.animate(
            withDuration: 0.33,
            delay: 0,
            options: .curveEaseIn,
            animations: {
            self.view.layoutIfNeeded()
        },
            completion: nil)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
   
    @IBAction func notificationButton(_ sender: NotificationButton) {
        AnalyticsManeger.addNotificationAnalytics(article: articleName)
        sender.notificationButtonBasicFunctions(view)
        notificationNamePost()
        PushNotifications.setupBasicNotification(body: articleName, inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
    }
        
    
    @IBAction func segmetedControl(_ sender: UISegmentedControl) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch  segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            basicsTextView.text = PlantsArticleData.plantsMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButtonOutlet.isHidden = false
        case 1:
            basicsTextView.text = PlantsArticleData.plantsBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButtonOutlet.isHidden = false
        case 2:
            basicsTextView.text = PlantsArticleData.plantsStructureContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButtonOutlet.isHidden = false
        case 3:
            basicsTextView.text = ""
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
            
            notificationButtonOutlet.isHidden = true
        default:
            print(" Error ")
        }
    }
}



//MARK: - ArticlesViewControllerDelegate
extension PlantsViewController: ArticlesViewControllerDelegate {
    var articleName: String { return "Plants" }
    
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
        systemBackground()
    }
    
    private func systemBackground() {
        progressView.viewSystemBack()
        switchOutlet.viewSystemBack()
        capitalView.viewSystemBack()
        switchView.viewSystemBack()
        stepperView.viewSystemBack()
        contentTextView.viewSystemBack()
        view.viewSystemBack()
    }
}



//MARK: - ArticleViewControllerSetupViewPrtocol
extension PlantsViewController: ArticleViewControllerSetupViewPrtocol {
    func viewDidApearAnimationPreview(_ views: [UIView], _ bonusAnomation: (() -> Void)?) {
        for (index, views) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                let alpha: CGFloat = 1
                
                views.alpha = alpha
                bonusAnomation!()
            })
        }
    }
    
    func procesingInformationShowing() {
        UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
            self.basicsTextView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            UIView.animate(withDuration: 0.3, animations: {
                self.activityIndicator.activityIndicatorStop()
                self.basicsTextView.mainTextViewTextColor(alpha: 1)
                self.progressView.stopProgress()
            })
        }
        progressView.basicProgress()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.startProgress()
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.activityIndicator.activityIndicatorStop()
                    self.basicsTextView.mainTextViewTextColor(alpha: 1)
                    self.progressView.stopProgress()
                })
            }
        }
    }
}



//MARK: - ArticlesVCconnectionProtocol
extension PlantsViewController: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.plantsVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}



//MARK: - Main Functions
extension PlantsViewController {
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    private func switchViewPrefering() {
        switchView.editorsViews()
        switchView.isHidden = true
        switchOutlet.viewSystemBack()
        
        switchOutlet.switchBasics()
        switchOutlet.viewSystemBack()
        switchOutlet.layer.cornerRadius = 20
        
        switchTextView.mainTextViewTextColor(alpha: 1)
        switchTextView.textViewShadow()
        switchTextView.switchTextViewPrefering()
    }
    
    private func stepperViewPrefering() {
        stepperView.editorsViews()
        stepper.stepperBaics()
    }
    
    func viewBasics() {
        stepperViewPrefering()
        switchViewPrefering()
        basicsTextViewSetup()
        segmentedControlOutletSetup()
        systemBackground()
        contentTextViewLayerSetup()
    }
    
    private func contentTextViewLayerSetup() {
        contentTextView.layer.cornerRadius = 20
    }
    
    private func basicsTextViewSetup() {
        basicsTextView.isEditable = false
        basicsTextView.mainTextViewTextColor(alpha: 0)
    }
    
    private func segmentedControlOutletSetup() {
        segmentedControlOutlet.segmentedControlBasics()
    }
    
    private func viewDidApearAnimation() {
        let objects = [notificationButtonOutlet, segmentedControlOutlet]
        
        viewDidApearAnimationPreview(objects as! [UIView], {
            DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                UIView.animate(withDuration: 0.4) {
                    self.someMoreView.alpha = 0.96
                }
            }
        })
    }
}
