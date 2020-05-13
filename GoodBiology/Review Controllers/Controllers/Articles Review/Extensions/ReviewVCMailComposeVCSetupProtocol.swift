//
//  ReviewVCMailComposeVCSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

// MARK: ReviewVCMailComposeVCSetupProtocol
extension ArticlesReviewViewController: ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Tests Review")
            composer.setMessageBody("Here is my problem or review on this app article or articles", isHTML: false)
            composer.view.tintColor = .biologyGreenColor
        
        present(composer, animated: true)
    }
    
    func showAndSetupMessageComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composeVC = MFMessageComposeViewController()
            composeVC.body = "My Problem: "
            composeVC.recipients = ["+380992776090"]
            composeVC.messageComposeDelegate = self
        
        self.present(composeVC, animated: true)
    }
}
