//
//  BasicsViewController.swift
//  GoodBiology
//
//  Created by tng on 12/16/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox

class BasicsViewController: UIViewController {
    typealias NextAction = () -> ()
    
    //MARK: IBOutlets
    @IBOutlet private weak var segmentedControl:         UISegmentedControl!
    @IBOutlet private weak var contentTextView:          UITextView!
    
    @IBOutlet private weak var backgroundView:           BiologyBackView!
    @IBOutlet private weak var notificationButton:       BiologyNotificationButton!
    
    // Stepper View
    @IBOutlet private weak var stepperView:              UIView!
    @IBOutlet private weak var stepper:                  UIStepper!
    
    // Switch View
    @IBOutlet private weak var switchTextView:           UITextView!
    @IBOutlet private weak var switchView:               UIView!
    @IBOutlet private weak var switchOutlet:             UISwitch!

    @IBOutlet private weak var activityIndicator:        UIActivityIndicatorView!
    
    // UIBarButtonItems
    @IBOutlet private weak var shareButton:              UIBarButtonItem!
    @IBOutlet private weak var settingsButton:           UIBarButtonItem!
    @IBOutlet private weak var switchViewShowingButton:  UIBarButtonItem!
    
    @IBOutlet private weak var navItem:                  UINavigationItem!
    
    //MARK: Public properties
    public var contentModel: BasicsModel?
    public var showNext:     NextAction?
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        finalView()
        systemBackPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [segmentedControl ,backgroundView, notificationButton]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.3
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.alpha = 1
            }) { (_) in
            }
        }
    }
    
    private func systemBackPrefering() {
        switchView.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    //MARK: Actions
    @IBAction func infoSwitch(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {

        case 0:
            if (navigationItem.title == "Basics") {
                contentTextView.text = basics
                
            } else if (navigationItem.title == "History") {
                contentTextView.text = history
                
            } else if (navigationItem.title == "History p. 2") {
                contentTextView.text = history2
                
            } else if (navigationItem.title == "Cell Theory") {
                contentTextView.text = cell
                
            } else if (navigationItem.title == "Evolution") {
                contentTextView.text = evolution
                
            } else if (navigationItem.title == "Genetics") {
                contentTextView.text = genetics
                
            } else if (navigationItem.title == "Structural") {
                contentTextView.text = structular
            }
        case 1:
            if (navigationItem.title == "Basics") {
                contentTextView.text = basicsBasics
                
            } else if (navigationItem.title == "History") {
                contentTextView.text = historyBasics
                
            } else if (navigationItem.title == "History p. 2") {
                contentTextView.text = history2Basics
                
            } else if (navigationItem.title == "Cell Theory") {
                contentTextView.text = cellBasics
                
            } else if (navigationItem.title == "Evolution") {
                contentTextView.text = evolutionBasics
                
            } else if (navigationItem.title == "Genetics") {
                contentTextView.text = geneticsBasics
                
            } else if (navigationItem.title == "Structural") {
                contentTextView.text = structularBasics
            }
        default:
            print("Error")
        }
    }
    
    private  func rate() {
        if navigationItem.title == "Botany" {
            RateManager.showRatesController()
        }
    }
    
    private func editorsViewTextPrefering() {
        switchTextView.font = UIFont(name: mediumFont, size: 13)
        
        switchTextView.isEditable   = false
        switchTextView.isSelectable = false
        
        switchTextView.textViewShadow()
    }
    
    private func editorsViewSetup() {
        stepperViewSetup()
        switchViewSetup()
    }
    
    private func stepperViewSetup() {
        stepperView.editorsViews()
        stepperView.layer.cornerRadius = 10
        
        stepperSetup()
    }
    
    private func switchViewSetup() {
        switchView.editorsViews()
        switchView.layer.cornerRadius = 9
        
        switchTextViewSetup()
        switchSetup()
    }
    
    private func cornersPrefering() {
        stepperView.layer.cornerRadius     = CGFloat(cornerRadius)
        contentTextView.layer.cornerRadius = 30
    }
    
    private func segmentedControlCostomizing() {
        segmentedControl.alpha      = 0
        segmentedControl.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    private func viewBasics() {
        editorsViewTextPrefering()
        segmentedControlSetup()
        activityIndicatorSetup()
        loadingViewPrefering()
        cornersPrefering()
        contentTextViewSetup()
    }
    
    private func switchSetup() {
        switchOutlet.switchBasics()
    }
    
    private func stepperSetup() {
        stepper.stepperBaics()
    }
    
    private func segmentedControlSetup() {
        segmentedControl.segmentedControlForToday()
        segmentedControlCostomizing()
    }
    
    private func activityIndicatorSetup() {
        activityIndicator.activityIndicatorStarts(colorOfActivity: .darkGray)
    }
    
    private func switchTextViewSetup() {
        switchTextView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func contentTextViewSetup() {
        contentTextView.font = UIFont(name: mediumFont, size: 17)
        contentTextView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        contentTextView.textViewShadow()
    }
    
    private func loadingViewPrefering() {
        UIView.animate(withDuration: 0, delay: 0.5, options: .curveLinear, animations: {
            self.contentTextView.mainTextViewTextColor(alpha: 1)
        }) {(finished) in
            self.activityIndicator.activityIndicatorStop()
        }
    }
    
    private func modelsPrefering() {
        navigationItem.title = contentModel?.title
        contentTextView.text = contentModel?.content
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
    
    //MARK: Public
    func configure(with basicsModel: BasicsModel, nextAction: NextAction?) {
        contentModel = basicsModel
        
        guard let nextClosure = nextAction else {
            self.navigationItem.rightBarButtonItem = nil
            return
        }
        showNext = nextClosure
    }
    
    //MARK: Actions
    @IBAction func sharing(_ sender: Any) {
        fastActivityVC(item: "\(contentTextView.text!)")
        
        shareAudio()
    }
    
    private func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
    
    private func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func bottomButtonAction(sender: UIButton) {
        if navigationItem.title == "Basics" {
            basicsScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "History" {
            historyScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "History p. 2" {
            historyPTwoScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Cell Theory" {
            cellTheotyScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Evolution" {
            evolutionScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Genetics" {
            geneticsScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        } else if navigationItem.title == "Structular" {
            structularScheduleNotification(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText) } else {
                    print(failText)
                }
            }
        }
        sender.pulsate()
        
        notificationButton.notificationButtonAudio()
        notificationButton.settingTittleForNotificationButton()
    }
    
    @IBAction func nextAction() {
        showNext?()
    }
    
    @IBAction func stepperViewShower(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden                = false
            
            switchViewShowingButton.isEnabled   = false
            shareButton.isEnabled               = false
            settingsButton.isEnabled            = true
        } else {
            stepperView.isHidden                = true
            
            switchViewShowingButton.isEnabled   = true
            shareButton.isEnabled               = true
            settingsButton.isEnabled            = true
        }
    }
    
    private func contentTextViewFontPrefering() {
        contentTextView.font = UIFont(name: "AvenirNext-Medium", size: 16.1)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font =  contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            notificationButton.isHidden = false
            settingsButton.isEnabled    = true
            shareButton.isEnabled       = true
            segmentedControl.isHidden   = false
            
            switchTextView.text         = "Hide  diffrent functions"
        } else {
            notificationButton.isHidden = true
            settingsButton.isEnabled    = false
            shareButton.isEnabled       = false
            segmentedControl.isHidden   = true
            
            switchTextView.text         = "Show diffrent functions"
        }
    }
    
    @IBAction func switchViewShowing(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    //MARK: Private
    private func prepareBackgroundView() {
        switchView.viewShadows()
        stepper.stepperShadow()
        stepperView.viewShadows()
        switchOutlet.switchShadow()
    }
    
    private func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}

extension BasicsViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        rate()
        editorsViewSetup()
        prepareBackgroundView()
        modelsPrefering()
        contentTextViewFontPrefering()
        viewBasics()
    }
}
