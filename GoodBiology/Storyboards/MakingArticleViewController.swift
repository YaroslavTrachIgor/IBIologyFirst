//
//  MakingArticleViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import MessageUI

final class MakingArticleViewController: UIViewController {
    
    //MARK: IBOutlets
    // Button
    @IBOutlet weak var mailButton: MailButton!
    
    // Content
    @IBOutlet weak var contentBackground:    ContentBack! { didSet{ contentBackground.alpha = 0 } }
    @IBOutlet weak var contentRulesTextView: MakingArticleVCContentRulesTextView!
    
    // Share Function
    @IBOutlet weak var shareButton:     ChromistaButton!
    @IBOutlet weak var shareButtonBack: ChromistaActionButtonsBack!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.shareButtonBack.alpha   = alpha
            self.contentBackground.alpha = alpha
        }
    }
}

extension MakingArticleViewController: MFMailComposeViewControllerDelegate {
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
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension MakingArticleViewController {
    
    @IBAction func mail(_ sender: UIButton) {
        let alertController = UIAlertController(title: "🧐", message: "You have precisely read the rules and are sure that your article is correct ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes, I am ready", style: .cancel) { (action) in
            guard MFMailComposeViewController.canSendMail() else { return }
            
            let composer                        = BasicMFMailComposeViewController(rootViewController: self)
                composer.mailComposeDelegate    = self
                composer.setSubject("User Article")
            composer.setMessageBody(MakingArticleViewControllerData.mailComposeBodyContentText, isHTML: false)
            self.present(composer, animated: true)
        }
        let noAction = UIAlertAction(title: "No, I did not finish reading", style: .default) { (action) in }
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                     alertController.view.tintColor = .biologyGreenColor
                     alertController.addAction(noAction)
                     alertController.addAction(yesAction)
        self.present(alertController, animated:  true)
    }
}
