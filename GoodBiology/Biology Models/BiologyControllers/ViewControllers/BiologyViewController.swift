//
//  BasicsViewController.swift
//  GoodBiology
//
//  Created by tng on 12/16/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import Combine
import GoogleMobileAds

// MARK: - Class with share data for MoreVC
// Here I use Singletone
final class BasicsViewControllerCopyData {
    static let shared = BasicsViewControllerCopyData()
    
    private init() {}
    var copyShareContent: String = ""
}

final class BiologyViewController: UIViewController {
    
    // Google ADMob Banner
    var interstitial: GADInterstitial!
    
    typealias NextAction = () -> ()
    
    //MARK: IBOutlets
    @IBOutlet weak var goToThemesButton: ChromistaButton! { didSet { goToThemesButton.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) } }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentTextView:  UITextView!
    
    @IBOutlet weak var backgroundView:     BiologyBackView!
    @IBOutlet weak var notificationButton: BiologyNotificationButton!
    
    /// Stepper View
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    /// Switch View
    @IBOutlet weak var switchTextView: UITextView!
    @IBOutlet weak var switchView:     UIView!
    @IBOutlet weak var switchOutlet:   UISwitch!

    /// UIActivityIndicatorView
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /// UINavigationItem
    @IBOutlet weak var navItem: UINavigationItem!
    
    //MARK: Public properties
    public var contentModel: BasicsModel?
    public var showNext:     NextAction?
    
    /// Button Backs
    @IBOutlet weak var switchViewShowingButtonBackView: ChromistaActionButtonsBack!
    @IBOutlet weak var stepperViewShowingButtonBack:    ChromistaActionButtonsBack!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /// Setup Final View
        finalView()
        viewBackSetup()
        setupInterstitial()
        setupSharedContent()
        createObservers()
        
        /// Setup navigation controller
        setupNavBarTitle()
        navigationControllerSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidApearAnimation()
    }
    
    override func viewWillLayoutSubviews() {
        view.setGradientBackground(colorOne: .white, colorTwo: .groupTableViewBackground)
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
}



// MARK: - Setup Content
extension BiologyViewController {
    private func setupSharedContent() {
        BasicsViewControllerCopyData.shared.copyShareContent = contentTextView.text!
    }
    
    private func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(BiologyViewController.observeFont(notification: )), name: MoreVCNotificationNames.fontName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BiologyViewController.observeFunctionsEnabled(notification: )), name: MoreVCNotificationNames.fontName, object: nil)
    }
    
    @objc func observeFont(notification: NSNotification) {
        contentTextView.font = UIFont(name: "AvenirNext-Medium", size: CGFloat(MoreViewControllerSharedProperties.shared.size))
    }
    
    @objc func observeFunctionsEnabled(notification: NSNotification) {
        let on = MoreViewControllerSharedProperties.shared.isOn
        
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.4) {
            var alpha: CGFloat
            self.navigationController?.hidesBarsOnSwipe = false
            
            alpha = 1
            self.notificationButton.alpha = alpha
            self.segmentedControl.alpha = alpha
            self.stepperViewShowingButtonBack.alpha = alpha
            
            self.notificationButton.isHidden = !on
            self.segmentedControl.isHidden   = !on
            self.stepperViewShowingButtonBack.isHidden = !on
            
            self.segmentedControl.isEnabled  = on
            
            self.switchTextView.text = on == true ? "Hide  diffrent functions" : "Show diffrent functions"
            
            self.view.layoutIfNeeded()
        }
    }
}



// MARK: - Setup Nav Item
extension BiologyViewController {
    private func setupNavBarTitle() {
        NotificationCenter.default.addObserver(self, selector: #selector(setupNavItemTextColorWhenPresentFRaomCollectionView(notification:)), name: MenuCollectionViewConterollerVCsPresentKeys.mainArticlesMenuVCpopKey, object: nil)
    }
    
    @objc func setupNavItemTextColorWhenPresentFRaomCollectionView(notification: NSNotification) {
        navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.biologyGreenColor]
    }
}
