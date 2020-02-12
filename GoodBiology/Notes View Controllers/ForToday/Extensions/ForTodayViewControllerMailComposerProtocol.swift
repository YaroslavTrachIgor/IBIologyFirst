//
//  File.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import MessageUI

protocol ForTodayViewControllerMailComposerProtocol {
    func showMailComposer()
}

extension ForTodayViewController: ForTodayViewControllerMailComposerProtocol {
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Map Problem")
            composer.setMessageBody("Here is my problem with map", isHTML: false)
        
        present(composer, animated: true)
    }
}
