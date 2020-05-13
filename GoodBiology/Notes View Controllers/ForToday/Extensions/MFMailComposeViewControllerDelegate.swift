//
//  MFMailComposeViewControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension ForTodayViewController: MFMailComposeViewControllerDelegate {
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
            print("Fatal Error")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
