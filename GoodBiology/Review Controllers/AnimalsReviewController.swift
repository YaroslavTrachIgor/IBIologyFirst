//
//  AnimalsReviewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/31/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import MessageUI

class AnimalsReviewController: UIViewController {

    @IBAction func reviewButton(_ sender: UIButton) {
        showMailComposer()
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["zhbr282@gmail.com"])
        composer.setSubject("Plants Article Review")
        composer.setMessageBody("Here is my problem or review on Plants article", isHTML: false)
        
        present(composer, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AnimalsReviewController: MFMailComposeViewControllerDelegate {
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
