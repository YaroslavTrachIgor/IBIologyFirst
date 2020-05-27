//
//  MakingArticleViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import MessageUI

//MARK: - MakingArticleViewControllerSetupProtocol protocol
protocol MakingArticleViewControllerSetupProtocol {
    func setupAnimation()
    func showComposer(composeVC: MFMailComposeViewController)
}


final class MakingArticleViewController: UIViewController {
    
    //MARK: - Presenter
    let presenter: MakingArticleViewControllerPresenter = MakingArticleViewControllerPresenter()
    
    //MARK: - IBOutlets
    //Button
    @IBOutlet weak var mailButton: MailButton!
    
    //Content
    @IBOutlet weak var contentBackground:    ContentBack! { didSet{ contentBackground.alpha = 0 } }
    @IBOutlet weak var contentRulesTextView: MakingArticleVCContentRulesTextView!
    
    //Share Function
    @IBOutlet weak var shareButton:     ChromistaButton!
    @IBOutlet weak var shareButtonBack: ChromistaActionButtonsBack!
    
    //MARK: - Overrides
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupAnimation()
    }
}



//MARK: - MFMailComposeViewControllerDelegate
extension MakingArticleViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        /// check for errors
        if let _ = error { controller.dismiss(animated: true) }
        
        /// switch diffrent results
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
            print("default")
        }
        
        /// dismiss controller
        controller.dismiss(animated: true, completion: nil)
    }
}



//MARK: - @IBActions
extension MakingArticleViewController {
    @IBAction func mail(_ sender: UIButton) {
        let composeVC = MFMailComposeViewController()
        
        ///Check for errors MFMailComposeViewController
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let alertController = UIAlertController(title: "🧐", message: "You have precisely read the rules and are sure that your article is correct ?", preferredStyle: .alert)
        
        ///Setup UIAlertActions
        let yesAction = UIAlertAction(title: "Yes, I am ready", style: .cancel) { (_) in
            
            ///Setup MFMailComposeViewController
            self.showComposer(composeVC: composeVC)
        }
        let noAction = UIAlertAction(title: "No, I did not finish reading", style: .default) { (action) in }
        
        /// Add Actions
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        /// Present UIAlertController
        presenter.presentAlert(for: self, alertController: alertController)
    }
    
    
    func showComposer(composeVC: MFMailComposeViewController) {
        
        ///Check for errors MFMailComposeViewController
        guard MFMailComposeViewController.canSendMail() else { return }
        
        /// Setup MFMailComposeViewController
        composeVC.mailComposeDelegate = self
        presenter.setupComposeVC(for: composeVC)
        
        /// Present MFMailComposeViewController
        present(composeVC, animated: true)
    }
}



//MARK: - MakingArticleViewControllerSetupProtocol extension
extension MakingArticleViewController: MakingArticleViewControllerSetupProtocol {
    func setupAnimation() {
        presenter.setupAnimation(shareButtonBack: shareButtonBack, contentBackground: contentBackground)
    }
}
