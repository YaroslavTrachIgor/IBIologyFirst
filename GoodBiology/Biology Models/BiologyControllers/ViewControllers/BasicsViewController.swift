//
//  BasicsViewController.swift
//  GoodBiology
//
//  Created by tng on 12/16/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class BasicsViewController: UIViewController {
    typealias NextAction = () -> ()
    
    //MARK: IBOutlets
    @IBOutlet weak var segmentedControl:         UISegmentedControl!
    @IBOutlet weak var contentTextView:          UITextView!
    
    @IBOutlet weak var backgroundView:           BiologyBackView!
    @IBOutlet weak var notificationButton:       BiologyNotificationButton!
    
    /// Stepper View
    @IBOutlet weak var stepperView:              UIView!
    @IBOutlet weak var stepper:                  UIStepper!
    
    /// Switch View
    @IBOutlet weak var switchTextView:           UITextView!
    @IBOutlet weak var switchView:               UIView!
    @IBOutlet weak var switchOutlet:             UISwitch!

    @IBOutlet weak var activityIndicator:        UIActivityIndicatorView!
    
    /// UIBarButtonItems
    @IBOutlet weak var shareButton:              UIBarButtonItem!
    
    /// UINavigationItem
    @IBOutlet weak var navItem:                  UINavigationItem!
    
    //MARK: Public properties
    public var contentModel: BasicsModel?
    public var showNext:     NextAction?
    
    /// Button Backs
    @IBOutlet weak var switchViewShowingButtonBackView: ChromistaActionButtonsBack!
    @IBOutlet weak var stepperViewShowingButtonBack:    ChromistaActionButtonsBack!
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        finalView()
        systemBackPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [switchViewShowingButtonBackView,stepperViewShowingButtonBack  ,segmentedControl ,backgroundView, notificationButton]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.3
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.alpha = 1
            })
        }
    }
    
    //MARK: Actions
    @IBAction func infoSwitch(_ sender: Any) {
        infoSwitchSetup()
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
    
    @IBAction func bottomButtonAction(sender: UIButton) {
        sender.notificationButtonBasicFunctions(view)
    }
    
    @IBAction func nextAction() {
        showNext?()
    }
    
    @IBAction func stepperViewShower(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden  = false
            shareButton.isEnabled = false
        } else {
            stepperView.isHidden  = true
            shareButton.isEnabled = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font =  contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            notificationButton.isHidden = false
            shareButton.isEnabled       = true
            segmentedControl.isHidden   = false
            
            switchTextView.text         = "Hide  diffrent functions"
        } else {
            notificationButton.isHidden = true
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
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        removeNotification(identifiers: identifiers)
    }
}
