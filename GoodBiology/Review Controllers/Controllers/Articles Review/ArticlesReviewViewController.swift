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
import SafariServices

// MARK: Main Class
final class ArticlesReviewViewController: UIViewController {

    //MARK: ViewModel
    let viewModel = ArticleVCViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var contentTextView:  UITextView!
    @IBOutlet weak var emailButton:      UIButton!
    @IBOutlet weak var shareButton:      UIBarButtonItem!
    
    @IBOutlet weak var switchTextView:   SwitchTextView!
    @IBOutlet weak var switchOutlet:     ArticlesReviewViewControllerSwitch!
    @IBOutlet weak var switchView: UIView! { didSet { switchView.editorsViews() } }
    
    @IBOutlet weak var contentBackgroundView: ContentBack!
    
    @IBOutlet weak var imageView: ArticlesReviewViewControllerIconImageView!
    
    @IBOutlet weak var sendButton: ContactButton!
    @IBOutlet weak var senfMessageButton: ContactButton! { didSet { senfMessageButton.setTitle("Contact with Messages", for: .normal) } }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ReviewControllerProtcol
        basicViewProcessesPrefering()
        viewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [imageView, sendButton, contentBackgroundView, senfMessageButton, switchTextView, contentTextView]
        viewModel.setupAnimation(views as! [UIView])
    }
    
    //MARK: Actions
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == true {
            viewModel.viewHidden(contentBackgroundView, hidden: false)
            viewModel.viewHidden(imageView, hidden: false)
            viewModel.setEnabled(shareButton, enabled: true)
            
            viewModel.switchTextViewTextSetup(switchTextView, text: "Hide diffrent functions")
        } else {
            viewModel.viewHidden(contentBackgroundView, hidden: true)
            viewModel.viewHidden(imageView, hidden: true)
            viewModel.setEnabled(shareButton, enabled: false)
            
            viewModel.switchTextViewTextSetup(switchTextView, text: "Show diffrent functions")
        }
    }
    
    @IBAction func orgonizeButton(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: switchView, main: view, nil)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        viewModel.presentActivityVC(text: contentTextView.text!, self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "ArticlesReviewViewController")
    }
    
    @IBAction func sending(_ sender: UIButton) {
        showAndSetupMailComposer()
        sender.flash()
        
        /// For Analytics
        AnalyticsManeger.addSupportActionEmailAnalytics(for: "ArticlesReviewViewController_email")
    }
    
    @IBAction func sendingWithMessages(_ sender: UIButton) {
        showAndSetupMessageComposer()
        sender.flash()
        
        /// For Analytics
        AnalyticsManeger.addSupportActionMessageAnalytics(for: "ArticlesReviewViewController_meassege")
    }
    
    @IBAction func faqSite(_ sender: Any) {
         showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
    }
}



// MARK: MFMailComposeViewControllerDelegate
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



// MARK: ReviewVCMailComposeVCSetupProtocol
extension ArticlesReviewViewController: ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        viewModel.presentMessageComposer(composer: composer)
        present(composer, animated: true)
    }
    
    func showAndSetupMessageComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        viewModel.presentMailComposer(composeVC: composeVC)
        present(composeVC, animated: true)
    }
}
