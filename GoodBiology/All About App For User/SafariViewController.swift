//
//  SafariViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 1/2/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices
import GoogleMobileAds

final class SafariViewController: UIViewController {
    
    //MARK: IBOutlets
    // UIViews
    @IBOutlet weak var contentTextView1Back: UIView!
    @IBOutlet weak var contentTextView2Back: UIView!
    
    // UITextViews
    @IBOutlet weak var contentTextView1: UITextView!
    @IBOutlet weak var contentTextView2: UITextView!
    
    // UIButtons
    @IBOutlet weak var mySiteButton:       UIButton!
    @IBOutlet weak var safariButtonOutlet: UIButton!
    
    @IBOutlet weak var goToContentAppButton: UIButton!
    
    // GADBannerView
    @IBOutlet weak var bunnerView: GADBannerView!
    
    //MARK: AppleButtonSettings
    var appleButton = AppleButtonSettings()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// AboutAppVCSetupProtocol
        setupVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4) {
            self.sizingPrefering()
            self.alphaPrefering()
        }
    }
    
    override func viewWillLayoutSubviews() {
        view.setGradientBackground(colorOne: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), colorTwo: #colorLiteral(red: 0.9771573604, green: 0.9771573604, blue: 0.9771573604, alpha: 1))
    }
}



//MARK: @IBActions
extension SafariViewController {
    @IBAction func mySyteShowing(_ sender: UIButton) {
        let address = "https://zhbr282.wixsite.com/ibiology-official"
        
        showSafariVC(for: address)
        pulsating(mySiteButton)
        
        /// For Analytics
        AnalyticsManeger.addSafariMainSyteOpenAnalytics(for: "Safari_View_Controller")
    }
    
    @IBAction func safariShower(_ sender: UIButton) {
        let address = "https://zhbr282.wixsite.com/goodbiology-policy"
        
        showSafariVC(for: address)
        pulsating(goToContentAppButton)
        
        /// For Analytics
        AnalyticsManeger.addSafariFAQOpenAnalytics(for: "Safari_View_Controller")
    }
    
    // MARK: Private
    private func pulsating(_ sender: UIButton) {
        sender.pulsate()
    }
}
