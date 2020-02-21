//
//  MakingArticleViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import MessageUI

class MakingArticleViewController: UIViewController {
    
    struct MakingArticleViewControllerData {
        static let contentRulesTextViewText =
        """
        1) We do not consider articles in which there are swear words
                
        2) We do not view articles that are simply copied from the Internet. We check them carefully.
                
        3) The article should be devoted to a specific topic.
                
        4) If you want to create an article that you show to your friends, then iBiology is not your choice.
        """
        
        static let mailComposeBodyContentText =
        """
        Place for your article and its editing.

        Theme:

        Article:

        Author:
        """
    }
    
    @IBOutlet weak var mailButton: UIButton! {
        didSet {
            cornerRadius = 20
            
            mailButton.fastButtonCostomizing(background:#colorLiteral(red: 0.009807545692, green: 0.3626862168, blue: 0.1271997988, alpha: 1), titleColor: .white, title: "Send your Article", corner: Float(CGFloat(cornerRadius)), borderWidth: 5)
        }
    }
    @IBOutlet weak var contentBackground:    ContentBack!
    @IBOutlet weak var contentRulesTextView: UITextView! {
        didSet {
            contentRulesTextView.bigContentTextViewsPrefering(size: 16)
            
            contentRulesTextView.text = MakingArticleViewControllerData.contentRulesTextViewText
            contentRulesTextView.textColor  = #colorLiteral(red: 0.28364219, green: 0.3071055974, blue: 0.3411921003, alpha: 1)
            contentRulesTextView.alpha      = 1
            contentRulesTextView.isHidden   = false
        }
    }
    
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
                     alertController.view.tintColor = lazyColor
                     alertController.addAction(noAction)
                     alertController.addAction(yesAction)
        self.present(alertController, animated:  true)
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
