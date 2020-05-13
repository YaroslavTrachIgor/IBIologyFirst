//
//  VirusesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/6/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox
import Social

protocol VirusesViewControllerRateSetupProtocol {
    func rate()
}

@available(iOS 13.0, *)
extension VirusesViewController: VirusesViewControllerRateSetupProtocol {
    func rate() {
        let group = DispatchGroup()
            group.enter()
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                RateManager.showRatesController()
                group.leave()
            }
        }
    }
}

@available(iOS 13.0, *)
final class VirusesViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView:         UITextView!
    
    @IBOutlet weak var notificationOutletButton: NotificationButton!
    
    @IBOutlet weak var stepperBackgroundView: UIView!
    @IBOutlet weak var settingsButton:        UIBarButtonItem!
    @IBOutlet weak var switchTextView:        UITextView!
    @IBOutlet weak var switchView:            UIView!
    
    @IBOutlet weak var activityIndicator: ArticleActivityIndicatorView!
    
    @IBOutlet weak var fixedSwitchView: UIView!
    @IBOutlet weak var stepper:         UIStepper!
    @IBOutlet weak var switchOutlet:    UISwitch!
    @IBOutlet weak var shareButton:     UIBarButtonItem!
    @IBOutlet weak var progressView:    UIProgressView!
    @IBOutlet weak var switchButoon:    UIBarButtonItem!
    
    @IBOutlet weak var goToImagesButton: ImageButton!
    @IBOutlet weak var goToVideosButton: VideoButton!
    
    //MARK: Actions
    @IBAction func sharing(_ sender: Any) {
        guard let content = textView.text else { return }
        FastActivityVC.show(item: content, vc: self)
        shareButton.shareAudio()
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            textView.isEditable                 = true
            segmentedControl.isHidden           = false
            notificationOutletButton.isHidden   = false
            settingsButton.isEnabled            = true
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            textView.isEditable                 = false
            segmentedControl.isHidden           = true
            notificationOutletButton.isHidden   = true
            settingsButton.isEnabled            = false
            shareButton.isEnabled               = false
            switchTextView.text                 = "Show diffrent functions"
            stepperBackgroundView.isHidden      = true
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        if fixedSwitchView.isHidden == true {
            fixedSwitchView.isHidden = false
        } else {
            fixedSwitchView.isHidden = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font        = textView.font?.fontName
        let fontSize    = CGFloat(sender.value)
        
        textView.font   = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func settings(_ sender: Any) {
        if (stepperBackgroundView.isHidden == true) {
            stepperBackgroundView.isHidden  = false
            
            shareButton.isEnabled           = false
            switchButoon.isEnabled          = false
        } else {
            stepperBackgroundView.isHidden  = true
            
            shareButton.isEnabled           = true
            switchButoon.isEnabled          = true
        }
    }
    
    @IBAction func segmentControlAction(_ sender: Any) {
        /// ArticlesViewCountProtocol
        setPopularityVoit()
        
        /// Set Content
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textView.text = VirusesArticleData.virusesMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationOutletButton.isHidden = false
        case 1:
            textView.text = VirusesArticleData.virusesBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationOutletButton.isHidden = false
        case 2:
            textView.text = VirusesArticleData.virusesStructureContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationOutletButton.isHidden = false
        case 3:
            textView.text = ""
            
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
            
            notificationOutletButton.isHidden = true
        default:
            print ("Error")
        }
    }
    
    @IBAction func notificationButton(_ sender: NotificationButton) {
        PushNotifications.setupBasicNotification(body: "Viruses", inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
        notificationNamePost()
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        let views = [notificationOutletButton, segmentedControl]
        viewDidApearAnimationPreview(views as! [UIView], nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
}

extension VirusesViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        rate()
        viewBasics()
        procesingInformationShowing()
    }
}

extension VirusesViewController: ArticlesVCconnectionProtocol {
    func notificationNamePost() {
        let notificationName = Notification.Name(rawValue: ArticelsViewControllerKeys.virusesVCKey)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}

extension VirusesViewController: ArticleViewControllerSetupViewPrtocol {
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
        
        progressView.setProgress(0, animated: true)
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

extension VirusesViewController {
    private func stepperViewPrefering() {
        stepper.stepperBaics()
        stepper.stepperShadow()
        stepperBackgroundView.editorsViews()
    }
    
    private func switchViewPrefering() {
        switchTextView.switchTextViewPrefering()
        switchOutlet.switchBasics()
        switchView.editorsViews()
        switchTextView.textViewShadow()
        switchTextView.textColor = .darkGray
    }
    
    private func viewBasics() {
        segmentedControlSetup()
        fixedSwitchView.viewShadows()
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
