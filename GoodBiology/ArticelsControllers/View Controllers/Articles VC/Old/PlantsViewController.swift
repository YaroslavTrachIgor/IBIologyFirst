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

enum UserActivityType: String {
    case openPlantsArticle = "yareyapp.GoodBiology.openPlantsArticle"
}

class PlantsViewController: UIViewController {
    
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
    override func viewDidAppear(_ animated: Bool) {
        let objects = [notificationButtonOutlet, segmentedControlOutlet]
        
        for (index, objects) in objects.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                let alpha: CGFloat = 1
                
                objects?.alpha = alpha
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    UIView.animate(withDuration: 0.4) {
                        self.someMoreView.alpha = 0.96
                    }
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
    
    func openPlantsArticle() {
        createUserActivityType()
    }
    
    @IBAction func hideSomeMoreView(_ sender: Any) {
        someMoreView.isHidden = true
    }
    
    private func createUserActivityType() {
        let activity = NSUserActivity(activityType: UserActivityType.openPlantsArticle.rawValue)
        
        activity.title = "Open Article about Plants"
        activity.isEligibleForSearch = true
        
        if #available(iOS 12.0, *) {
            activity.isEligibleForPrediction = true
        }
        
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
    }
    
    private func systemBackground() {
        if #available(iOS 13.0, *) {
            progressView.viewSystemBack()
            switchOutlet.viewSystemBack()
            capitalView.viewSystemBack()
            switchView.viewSystemBack()
            stepperView.viewSystemBack()
            contentTextView.viewSystemBack()
            view.viewSystemBack()
        }
    }
    
    //MARK: Action
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if switchView.isHidden == false {
            switchView.isHidden = true
        } else {
            switchView.isHidden = false
        }
    }
    
    @IBAction func sharing(_ sender: Any) {
        if basicsTextView.text == plantsBasicsContent {
            fastActivityVC(item: plantsBasicsContent)
            
        } else if basicsTextView.text == plantsStructureContent {
            fastActivityVC(item: plantsStructureContent)
            
        } else {
            fastActivityVC(item: plantsMostContent)
        }
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
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText(plantsMostContent)
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
                
                post.setInitialText(plantsMostContent)
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
    
    func showAlert(service: String) {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
                alert.addAction(action)
                alert.view.tintColor = lazyColor
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn == true {
            basicsTextView.isEditable           = true
            basicsTextView.isSelectable         = true
            segmentedControlOutlet.isHidden     = false
            notificationButtonOutlet.isHidden   = false
            settingsButton.isEnabled            = true
            shareButton.isEnabled               = true
            switchTextView.text                 = "Hide  diffrent functions"
        } else {
            basicsTextView.isEditable           = false
            basicsTextView.isSelectable         = false
            segmentedControlOutlet.isHidden     = true
            notificationButtonOutlet.isHidden   = true
            settingsButton.isEnabled            = false
            shareButton.isEnabled               = false
            stepperView.isHidden                = true
            switchTextView.text                 = "Show diffrent functions"
            stepperView.isHidden                = true
        }
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden    = false
            
            shareButton.isEnabled   = false
            switchButton.isEnabled  = false
        } else {
            stepperView.isHidden    = true
            
            shareButton.isEnabled   = true
            switchButton.isEnabled  = true
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font            = basicsTextView.font?.fontName
        let fontSize        = CGFloat(sender.value)
        
        basicsTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    deinit {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: Actions
    @IBAction func notificationButton(_ sender: NotificationButton) {
        plantsScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
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
        viewDidLoadPrinting(doing: "Plants")
    }
        
    //MARK: Actions
    @IBAction func segmetedControl(_ sender: UISegmentedControl) {
        switch  segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            basicsTextView.text = plantsMostContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButtonOutlet.isHidden = false
        case 1:
            basicsTextView.text = plantsBasicsContent
            
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
            
            notificationButtonOutlet.isHidden = false
        case 2:
            basicsTextView.text = plantsStructureContent
            
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

extension PlantsViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
        systemBackground()
    }
}
