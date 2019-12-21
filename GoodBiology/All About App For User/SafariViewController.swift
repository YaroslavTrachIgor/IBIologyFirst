//
//  SafariViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 1/2/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var contentTextView1:         UITextView!
    @IBOutlet weak var contentTextView2:         UITextView!
    @IBOutlet weak var safariButtonOutlet:       UIButton!
    @IBOutlet weak var goToContentAppButton:     UIButton!
    @IBOutlet weak var mySiteButton:             UIButton!
    
    var appleButton = AppleButtonSettings()
    
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
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: 1.0, y: 1.0)
        goToContentAppButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        mySiteButton.transform         = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4) {
            self.sizingPrefering()
            self.alphaPrefering()
        }
    }
    
    //MARK: Public
    private func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            //Show an invalid URL error alert
            return
        }
        let safariVC = SFSafariViewController(url: url)
            safariVC.preferredBarTintColor      = #colorLiteral(red: 0, green: 0.2316439748, blue: 0, alpha: 1)
            safariVC.preferredControlTintColor  = .white
        
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
        contentTextView1.alpha = 0
        contentTextView2.alpha = 0
        
        mySiteButton.transform         = CGAffineTransform(scaleX: 0.0, y: 0.0)
        safariButtonOutlet.transform   = CGAffineTransform(scaleX: 0.0, y: 0.0)
        goToContentAppButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    }
    
    private func navItem() {
        navigationItem.title = "About App"
    }
    
    private func buttonsPrefering() {
        goToContentAppButton.basicButtonForSafariViewController(title: "General Info")
        
        mySiteButton.setTitleColor(appleButton.titleColor, for: .normal)
        mySiteButton.backgroundColor = appleButton.backgroundColor
        mySiteButton.layer.cornerRadius = appleButton.appleButtonCornerRadius
        mySiteButton.titleLabel?.font = appleButton.font
        mySiteButton.setTitle("iBiology Site", for: .normal)
        
        safariButtonOutlet.setTitleColor(appleButton.titleColor, for: .normal)
        safariButtonOutlet.backgroundColor = appleButton.backgroundColor
        safariButtonOutlet.layer.cornerRadius = appleButton.appleButtonCornerRadius
        safariButtonOutlet.titleLabel?.font = appleButton.font
        safariButtonOutlet.setTitle("Privacy Policy", for: .normal)
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsPrefering()
        viewBasicSizingPrefering()
        navItem()
        contentTextViewsPrefering()
    }
}

extension UIButton {
    func basicButtonForSafariViewController(title: String) {
        self.fastButtonCostomizing(background: #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1), titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), title: title, corner: 18.8, borderWidth: 4)
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
