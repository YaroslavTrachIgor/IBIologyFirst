//
//  PlantsReviewViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/30/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import MessageUI
import UserNotifications
import AudioToolbox

class ArticlesReviewViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var contentTextView:  UITextView!
    @IBOutlet weak var emailButton:      UIButton!
    @IBOutlet weak var shareButton:      UIBarButtonItem!
    @IBOutlet weak var textView:         UITextView! {
        didSet {
            textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textView.font      = UIFont(name: "AvenirNext-DemiBold", size: 14)
            textView.layer.shadowRadius = 7
            
            textView.textViewShadow()
        }
    }
    @IBOutlet weak var switchOutlet:     UISwitch! {
        didSet{ switchOutlet.switchShadow()
        }
    }
    @IBOutlet weak var switchView: UIView! {
        didSet {
            switchView.editorsViews()
        }
    }
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var imageView:             UIImageView! {
        didSet {
            imageView.layer.cornerRadius    = 50
            imageView.layer.masksToBounds   = true
            imageView.layer.borderColor     = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
            imageView.layer.borderWidth     = 11
            
            imageView.imageViewShadow()
        }
    }
    @IBOutlet weak var sendButton: UIButton!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ReviewControllerProtcol
        basicViewProcessesPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [imageView, sendButton, contentBackgroundView, textView, contentTextView]
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                UIApplication.shared.beginIgnoringInteractionEvents()
                view?.alpha = 1
            }) { (_) in
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
    private func systemBackPrefering() {
        view.viewSystemBack()
        
        contentTextView.systemTextColor()
        textView.systemTextColor()
        
        switchView.viewSystemBack()
        contentBackgroundView.viewSystemBack()
    }
    
    //MARK: Actions
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            contentBackgroundView.isHidden  = false
            shareButton.isEnabled           = true
            imageView.isHidden              = false
            textView.text                   = "Hide diffrent functions"
        } else {
            contentBackgroundView.isHidden  = true
            shareButton.isEnabled           = false
            imageView.isHidden              = true
            textView.text                   = "Show diffrent functions"
        }
    }
    
    @IBAction func orgonizeButton(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["My Article Problem"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    @IBAction func sending(_ sender: UIButton) {
        showMailComposer()
        sender.flash()
    }
    
    //MARK: Public
    private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Articles Review")
            composer.setMessageBody("Here is my problem or review on one of this app article or articles", isHTML: false)
            composer.view.tintColor = lazyColor
        
        present(composer, animated: true)
    }
    
    private func alphaPrefering() {
        let alpha = 0
        
        contentTextView.alpha  = CGFloat(alpha)
        textView.alpha         = CGFloat(alpha)
        sendButton.alpha       = CGFloat(alpha)
        imageView.alpha        = CGFloat(alpha)
    }
    
    private func viewBasics() {
        sendButtonSetup()
        alphaPrefering()
    }
    
    private func sendButtonSetup() {
        sendButton.buttonsShadows()
        sendButton.fastButtonCostomizing(background: #colorLiteral(red: 0.004247154575, green: 0.453612864, blue: 0.1538792849, alpha: 1), titleColor: .white, title: "Contact with Email", corner: 16, borderWidth: 4.8)
    }
    
    private func contentBackgroundViewPrefering() {
        contentBackgroundView.viewShadows()
        
        contentBackgroundView.layer.cornerRadius   = 16
        contentBackgroundView.alpha = 0
        
        contentTextViewSetup()
    }
    
    private func contentTextViewSetup() {
        contentTextView.bigContentTextViewsPrefering(size: 21)
    }
}

extension ArticlesReviewViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("email was saved")
        case .sent:
            print("Email has been sent")
        case .failed:
            print("Failed Email sending")
        @unknown default:
            print("Fatal Error. SOS !!!")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ArticlesReviewViewController: ReviewControllerProtcol {
    func basicViewProcessesPrefering() {
        viewBasics()
        contentBackgroundViewPrefering()
        systemBackPrefering()
    }
}
