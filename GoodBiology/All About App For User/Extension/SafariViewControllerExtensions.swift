//
//  SafariViewControllerExtensions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

extension SafariViewController: AboutAppVCSetupProtocol {
    
    /// for viewDidLoad
    func setupVC() {
        navItem()
        buttonsPrefering()
        alphaPrefering()
        sizingPrefering()
        contentTextViewsPrefering()
        viewBasicSizingPrefering()
        textViewBacksSetup()
        setupBunnerView()
    }
}

extension SafariViewController {
    
    //MARK: - Public
    //MARK: viewDidApear
    /// Setup Alpha
    func alphaPrefering() {
        let alpha = 1
        
        contentTextView1.alpha = CGFloat(alpha)
        contentTextView2.alpha = CGFloat(alpha)
    }
    
    /// Setup CGAffineTransform
    func sizingPrefering() {
        let scaleXY: CGFloat = 1.0
        
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
        goToContentAppButton.transform = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
        mySiteButton.transform         = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
    }
    
    //MARK: - Private
    //MARK: viewDidLoad
    private func navItem() {
        navigationItem.title = "About App"
    }
    
    /// Setup main Buttons
    private func buttonsPrefering() {
        appleButton.appleButtonCornerRadius = 12
        
        goToContentAppButton.basicButtonForSafariViewController(title: "General Info")
        
        mySiteButton.backgroundColor = appleButton.backgroundColor
        mySiteButton.setTitleColor(appleButton.titleColor, for: .normal)
        mySiteButton.layer.cornerRadius = CGFloat(appleButton.appleButtonCornerRadius)
        mySiteButton.titleLabel?.font = appleButton.font
        mySiteButton.setTitle("iBiology Site", for: .normal)
        
        safariButtonOutlet.backgroundColor = appleButton.backgroundColor
        safariButtonOutlet.setTitleColor(appleButton.titleColor, for: .normal)
        safariButtonOutlet.layer.cornerRadius = CGFloat(appleButton.appleButtonCornerRadius)
        safariButtonOutlet.titleLabel?.font = appleButton.font
        safariButtonOutlet.setTitle("Privacy Policy", for: .normal)
    }
    
    /// contentTextView1 Setup
    private func contentTextView1Prfering() {
        contentTextView1.safariVCUITextViewPrefering(font: "DemiBold", size: 20)
    }
    
    /// contentTextView2 Setup
    private func contentTextView2Prfering() {
        contentTextView2.safariVCUITextViewPrefering(font: "Medium", size: 18)
    }
    
    /// contentTextView2Prfering and contentTextView1Prfering
    private func contentTextViewsPrefering() {
        contentTextView2Prfering()
        contentTextView1Prfering()
    }
    
    /// Setup Alpha and CGAffineTransform UI for this VC
    /// For viewDidLoad
    private func viewBasicSizingPrefering() {
        let alpha: CGFloat = 0
        let scale: CGFloat = 0
        
        /// Set Alpha for contentTextView1 and contentTextView2
        contentTextView1.alpha = alpha
        contentTextView2.alpha = alpha
        
        mySiteButton.transform         = CGAffineTransform(scaleX: scale, y: scale)
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: scale, y: scale)
        goToContentAppButton.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    /// Setup main contentTextViews and there backs
    private func textViewBacksSetup() {
        contentTextView1Back.viewShadows()
        contentTextView2Back.viewShadows()
        
        let cornerRadius: CGFloat = 13
        
        /// Set cornerRadius for contentTextView1 and contentTextView2
        contentTextView1.layer.cornerRadius = cornerRadius
        contentTextView2.layer.cornerRadius = cornerRadius
        
        /// Set cornerRadius for contentTextView1Back and contentTextView2Back
        contentTextView1Back.layer.cornerRadius = cornerRadius
        contentTextView2Back.layer.cornerRadius = cornerRadius
        
        contentTextView1.text =
        """
        Privacy Policy and site of
        iBiology
        """
    }
    
    private func setupBunnerView() {
        bunnerView.adUnitID = "ca-app-pub-8702634561077907/9283193921"
        bunnerView.rootViewController = self
        bunnerView.load(GADRequest())
    }
}

extension UIButton {
    func basicButtonForSafariViewController(title: String) {
        self.fastButtonCostomizing(background: .biologyGreenColor, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), title: title, corner: 18.8, borderWidth: 4)
    }
}

extension UITextView {
    func safariVCUITextViewPrefering(font: String, size: Float) {
        if #available(iOS 13.0, *) {
            self.textColor = .secondaryLabel
            self.font      =  UIFont(name: "AvenirNext-\(font)", size: CGFloat(size))
        }
    }
}
