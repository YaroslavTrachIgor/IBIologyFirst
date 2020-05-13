//
//  ReviewVCMailComposeVCSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension TestsReviewViewController: ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Tests Review")
            composer.setMessageBody("Here is my problem or review on this app test or tests", isHTML: false)
            composer.view.tintColor = .biologyGreenColor
        
        present(composer, animated: true)
    }
}
