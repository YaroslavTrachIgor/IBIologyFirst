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

class ArchaeaViewController: UIViewController {

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
        UIView.animate(withDuration: 0.4) {
            let alpha: CGFloat = 1
            
            self.notificationButton.alpha   = alpha
            self.segmentControlOutlet.alpha = alpha
        }
    }
    
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
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText(ArchaeaArticleData.archaeaMostContent)
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
                
                post.setInitialText(ArchaeaArticleData.archaeaMostContent)
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
        let font            =  basicsTextView.font?.fontName
        let fontSize        = CGFloat(sender.value)
        
        basicsTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    //MARK: Actions
    @IBAction func segmentedControl(_ sender: Any) {
        switch  segmentControlOutlet.selectedSegmentIndex {
        case 0:
            basicsTextView.text = ArchaeaArticleData.archaeaMostContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 1:
            basicsTextView.text = ArchaeaArticleData.archaeaBasicsContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 2:
            basicsTextView.text = ArchaeaArticleData.archaeaStructureContent
            goToImagesButton.isHidden = true
            goToVideosButton.isHidden = true
        case 3:
            basicsTextView.text = ""
            goToImagesButton.isHidden = false
            goToVideosButton.isHidden = false
        default:
            print(" Error ")
        }
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: Actions
    @IBAction func notificationButton(_ sender: NotificationButton) {
        archaeaScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
            if success { print(congratsText) } else { print(failText) }
        }
        sender.notificationButtonBasicFunctions(view)
    }
    
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
    
    private func procesingInformationShowing() {
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
        viewDidLoadPrinting(doing: "Archaea")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
    }
}

extension ArchaeaViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        viewBasics()
        procesingInformationShowing()
    }
}
