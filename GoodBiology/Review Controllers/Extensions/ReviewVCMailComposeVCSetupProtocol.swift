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

extension ArticlesReviewViewController: ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController(rootViewController: self)
            composer.mailComposeDelegate = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Problem with iBiology application")
            composer.setMessageBody("My Problem: ", isHTML: false)
            composer.view.tintColor = .biologyGreenColor
        
        present(composer, animated: true)
    }
    
    func showAndSetupMessageComposer() {
        guard MFMessageComposeViewController.canSendText() else { return }
        
        let composeVC = MFMessageComposeViewController(rootViewController: self)
        composeVC.messageComposeDelegate = self
        composeVC.recipients = ["+380992776090"]
        composeVC.body = "My Problem: "
        composeVC.view.tintColor = .biologyGreenColor
    }
}
