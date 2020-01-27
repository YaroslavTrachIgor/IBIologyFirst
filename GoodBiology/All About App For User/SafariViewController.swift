//
//  SafariViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 1/2/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices

@available(iOS 13.0, *)
class SafariViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var contentTextView1Back: UIView!
    @IBOutlet weak var contentTextView2Back: UIView!
    
    @IBOutlet weak var contentTextView1:         UITextView!
    @IBOutlet weak var contentTextView2:         UITextView!
    
    @IBOutlet weak var safariButtonOutlet:       UIButton!
    @IBOutlet weak var goToContentAppButton:     UIButton!
    @IBOutlet weak var mySiteButton:             UIButton!
    
    var appleButton = AppleButtonSettings()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsPrefering()
        viewBasicSizingPrefering()
        navItem()
        contentTextViewsPrefering()
        textViewBacksSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4) {
            self.sizingPrefering()
            self.alphaPrefering()
        }
    }
    
    private func textViewBacksSetup() {
        cornerRadius = 20
        
        contentTextView1Back.viewShadows()
        contentTextView2Back.viewShadows()
        
        contentTextView1.layer.cornerRadius = cornerRadius
        contentTextView2.layer.cornerRadius = cornerRadius
        
        contentTextView1Back.layer.cornerRadius = cornerRadius
        contentTextView2Back.layer.cornerRadius = cornerRadius
        
        contentTextView1.text =
        """
        Privacy Policy and site of
        iBiology
        """
    }
    
    private func pulsating(_ sender: UIButton) {
        sender.pulsate()
    }
    
    @IBAction func mySyteShowing(_ sender: UIButton) {
        showSafariVC(for: "https://zhbr282.wixsite.com/ibiology-official")
        pulsating(mySiteButton)
    }
    
    @IBAction func safariShower(_ sender: UIButton) {
        showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
        pulsating(goToContentAppButton)
    }
    
    private func alphaPrefering() {
        let alpha = 1
        
        contentTextView1.alpha = CGFloat(alpha)
        contentTextView2.alpha = CGFloat(alpha)
    }
    
    private func sizingPrefering() {
        let scaleXY: CGFloat = 1.0
        
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
        goToContentAppButton.transform = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
        mySiteButton.transform         = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
    }
    
    //MARK: Public
    private func showSafariVC(for url: String) {
        guard let url = URL(string: url) else { return }
        let safariVC = BasicSafariVC(url: url)
        safariVC.setupSafariVC()
        
        present(safariVC, animated: true)
    }
    
    private func contentTextView1Prfering() {
        contentTextView1.safariVCUITextViewPrefering(font: "DemiBold", size: 20)
    }
    
    private func contentTextView2Prfering() {
        contentTextView2.safariVCUITextViewPrefering(font: "Medium", size: 18)
    }
    
    private func contentTextViewsPrefering() {
        contentTextView2Prfering()
        contentTextView1Prfering()
    }
    
    private func viewBasicSizingPrefering() {
        let alpha: CGFloat = 0
        let scale: CGFloat = 0.0
        
        contentTextView1.alpha = alpha
        contentTextView2.alpha = alpha
        
        mySiteButton.transform         = CGAffineTransform(scaleX: scale, y: scale)
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: scale, y: scale)
        goToContentAppButton.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    private func navItem() {
        navigationItem.title = "About App"
    }
    
    private func buttonsPrefering() {
        cornerRadius = appleButton.appleButtonCornerRadius
        appleButton.appleButtonCornerRadius = 12
        
        goToContentAppButton.basicButtonForSafariViewController(title: "General Info")
        
        mySiteButton.setTitleColor(appleButton.titleColor, for: .normal)
        mySiteButton.backgroundColor = appleButton.backgroundColor
        mySiteButton.layer.cornerRadius = cornerRadius
        mySiteButton.titleLabel?.font = appleButton.font
        mySiteButton.setTitle("iBiology Site", for: .normal)
        
        safariButtonOutlet.setTitleColor(appleButton.titleColor, for: .normal)
        safariButtonOutlet.backgroundColor = appleButton.backgroundColor
        safariButtonOutlet.layer.cornerRadius = cornerRadius
        safariButtonOutlet.titleLabel?.font = appleButton.font
        safariButtonOutlet.setTitle("Privacy Policy", for: .normal)
    }
}

extension UIButton {
    func basicButtonForSafariViewController(title: String) {
        self.fastButtonCostomizing(background: lazyColor, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), title: title, corner: 18.8, borderWidth: 4)
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
