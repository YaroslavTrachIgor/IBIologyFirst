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
    
    
    @IBOutlet weak var mailButton:           UIButton!
    @IBOutlet weak var contentBackground:    UIView!
    @IBOutlet weak var contentRulesTextView: UITextView!
    
    @IBAction func mail(_ sender: UIButton) {
        let alertController = UIAlertController(title: "🧐", message: "You have precisely read the rules and are sure that your article is correct ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes, I am ready", style: .cancel) { (action) in
            guard MFMailComposeViewController.canSendMail() else { return }
            
            let composer                        = MFMailComposeViewController()
                composer.mailComposeDelegate    = self
                composer.setToRecipients(["zhbr282@gmail.com"])
                composer.setSubject("User Article")
                composer.setMessageBody("""
Place for your article and its editing.

Theme:

Article:

Author:
""", isHTML: false)
            self.present(composer, animated: true)
        }
        let noAction = UIAlertAction(title: "No, I did not finish reading", style: .default) { (action) in }
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                     alertController.view.tintColor = lazyColor
                     alertController.addAction(noAction)
                     alertController.addAction(yesAction)
        self.present(alertController, animated:  true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextViewSettingsPrefering()
        contentBackPrefering()
        mailButtonPrefering()
    }
    
    private func contentBackPrefering() {
        contentBackground.layer.cornerRadius = 18
        contentBackground.viewShadows()
    }
    
    private func contentTextViewSettingsPrefering() {
        contentRulesTextView.bigContentTextViewsPrefering(size: 21)
        
        contentRulesTextView.text = """
        1) We do not consider articles in which there are swear words
                
        2) We do not view articles that are simply copied from the Internet. We check them carefully.
                
        3) The article should be devoted to a specific topic.
                
        4) If you want to create an article that you show to your friends, then iBiology is not your choice.
        """
        contentRulesTextView.textColor  = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        contentRulesTextView.alpha      = 1
        contentRulesTextView.isHidden   = false
    }
    
    private func mailButtonPrefering() {
        cornerRadius = 20
        
        mailButton.fastButtonCostomizing(background:#colorLiteral(red: 0.009807545692, green: 0.3626862168, blue: 0.1271997988, alpha: 1), titleColor: .white, title: "Send your Article", corner: Float(CGFloat(cornerRadius)), borderWidth: 5)
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
