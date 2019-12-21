//
//  TestsReviewViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 1/13/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import MessageUI
import UIKit
import AudioToolbox

class TestsReviewViewController: UIViewController {
    
    //MARK: Actions
    @IBOutlet weak var shareButton:          UIBarButtonItem!
    @IBOutlet weak var switchTextView:       UITextView!
    @IBOutlet weak var switchView:           UIView!
    @IBOutlet weak var switchOutlet:         UISwitch!
    @IBOutlet weak var testBackgroundView:   UIView!
    @IBOutlet weak var headLineTextView:     UITextView!
    @IBOutlet weak var contentTextView:      UITextView!
    @IBOutlet weak var sendButton:        UIButton! {
        didSet {
            sendButton.layer.cornerRadius = 20
        }
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ReviewControllerProtcol
        basicViewProcessesPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.sendButton.alpha           = 1
            self.testBackgroundView.alpha   = 1
            self.headLineTextView.alpha     = 1
            self.contentTextView.alpha      = 1
        }
    }
    
    private func viewBasicsPrefering() {
        sendButtonSetup()
        switchViewSetup()
        testBackgroundViewSetup()
        contentTextViewSetup()
        navigationControllerTintSetup()
    }
    
    private func systemBackPrefering() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            switchTextView.textSystemColor()
            switchTextView.backgroundColor = .systemBackground
            testBackgroundView.viewSystemBack()
            switchView.viewSystemBack()
        }
    }
    
    @IBAction func functionsHidden(_ sender: UISwitch) {
        if sender.isOn == true {
            switchTextView.text = "Hide diffrent text"
            
            headLineTextView.isHidden   = false
            contentTextView.isHidden    = false
            testBackgroundView.isHidden = false
            shareButton.isEnabled       = true
        } else {
            switchTextView.text = "Show diffrent text"
            
            headLineTextView.isHidden   = true
            contentTextView.isHidden    = true
            testBackgroundView.isHidden = true
            shareButton.isEnabled       = false
        }
    }
    
    @IBAction func showingSwitchView(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: ["My Test Problem"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        shareButton.shareAudio()
    }
    
    @IBAction func contact(_ sender: Any) {
        showMailComposer()
    }
    
    //MARK: Public
    private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Tests Review")
            composer.setMessageBody("Here is my problem or review on this app test or tests", isHTML: false)
            composer.view.tintColor = lazyColor
        
        present(composer, animated: true)
    }
    
    private func alphaPrefering() {
        let alpha = 0
        
        sendButton.alpha           = CGFloat(alpha)
        contentTextView.alpha      = CGFloat(alpha)
        headLineTextView.alpha     = CGFloat(alpha)
        testBackgroundView.alpha   = CGFloat(alpha)
    }
    
    private func cornersPrefering() {
        switchView.layer.cornerRadius           = CGFloat(cornerRadius)
        switchTextView.layer.cornerRadius       = CGFloat(cornerRadius)
        
        testBackgroundView.layer.cornerRadius   = 19.4
    }
    
    private func testBackgroundViewSetup() {
        testBackgroundView.viewShadows()
    }
    
    private func contentTextViewSetup() {
        contentTextView.bigContentTextViewsPrefering(size: 18.7)
    }
    
    private func navigationControllerTintSetup() {
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
    }
    
    private func switchViewSetup() {
        switchView.isHidden = true
        switchView.editorsViews()
        switchTextViewSetup()
        switchOutletSetup()
    }
    
    private func switchOutletSetup() {
        switchOutlet.switchBasics()
    }
    
    
    private func switchTextViewSetup() {
        switchTextView.switchTextViewPrefering()
        switchTextView.font = UIFont(name: mediumFont, size: 14)
    }
    
    private func sendButtonSetup() {
        self.sendButton.fastButtonCostomizing(background: #colorLiteral(red: 0.01995553821, green: 0.3423653841, blue: 0.1189347133, alpha: 1), titleColor: .white, title: "Contact with Email", corner: 19.4, borderWidth: 4)
    }
}

extension TestsReviewViewController: MFMailComposeViewControllerDelegate {
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

extension TestsReviewViewController: ReviewControllerProtcol {
    func basicViewProcessesPrefering() {
        alphaPrefering()
        cornersPrefering()
        viewBasicsPrefering()
        systemBackPrefering()
    }
}
