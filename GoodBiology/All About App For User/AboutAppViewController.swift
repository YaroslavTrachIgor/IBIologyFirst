//
//  AboutAppViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class AboutAppViewController: UIViewController {

    @IBOutlet private var contentBackground:    UIView!
    @IBOutlet private var contentTextView:      UITextView!
    @IBOutlet private var shareButton:          UIBarButtonItem!
    @IBOutlet private var stepper:              UIStepper!
    @IBOutlet private var stepperView:          UIView!
    @IBOutlet private var backButton:           UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsPrefering()
        contentPrefering()
        otherUIthings()
        navItem()
        systemBackSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4) {
            let views = [self.contentBackground, self.contentTextView]
            
            for (index, view) in views.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    UIApplication.shared.beginIgnoringInteractionEvents()
                    view?.alpha = 1
                }) { (_) in
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            }
        }
    }
    
    private func systemBackSetup() {
        stepperView.viewSystemBack()
        contentBackground.viewSystemBack()
        
        contentTextView.systemTextColor()
        
        view.viewSystemBack()
    }
    
    private func viewsPrefering() {
        contentBackSetup()
        stepperViewSetup()
        preferingCorners()
        contentTextViewPrefering()
    }
    
    private func contentBackSetup() {
        contentBackground.viewShadows()
    }
    
    private func stepperViewSetup() {
        stepperView.editorsViews()
        
        stepperOutletSetup()
    }
    
    private func stepperOutletSetup() {
        stepper.stepperBaics()
    }
    
    private func backButtonPrefering() {
        backButton.setTitleTextAttributes([
        NSAttributedString.Key.font : UIFont(name: "AvenirNext-Medium", size: 18.74)!,
        NSAttributedString.Key.foregroundColor : lazyColor,
        ], for: .normal)
    }
    
    private func contentPrefering() {
        contentBackground.alpha = 0
        contentTextView.alpha   = 0
    }
    
    private func otherUIthings() {
        stepperView.isHidden = true
    }
    
    private func contentTextViewPrefering() {
        contentTextView.bigContentTextViewsPrefering(size: 16)
    }
    
    private func navItem() {
        self.navigationItem.title = "General"
    }
    
    @IBAction func contentSizing(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func stepperViewShowing(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    private func preferingCorners() {
        let cornerRadius = 20
        
        contentTextView.layer.cornerRadius   = CGFloat(cornerRadius)
        contentBackground.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    @IBAction func sharing(_ sender: Any) {
        fastActivityVC(item: appInfo)
        shareButton.shareAudio()
    }
    
    @IBAction func testSharing(_ sender: Any) {
        fastActivityVC(item: testInfo)
        shareButton.shareAudio()
    }
    
    private func fastActivityVC(item: String) {
        let activityVC = UIActivityViewController(activityItems: [item], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
