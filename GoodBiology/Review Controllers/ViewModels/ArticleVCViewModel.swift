//
//  ArticleVCViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class ArticleVCViewModel {
    func setEnabled(_ button: UIButton, enabled: Bool) {
        button.isEnabled = enabled
    }
    
    func setEnabled(_ barButton: UIBarButtonItem, enabled: Bool) {
        barButton.isEnabled = enabled
    }
    
    func viewHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func switchTextViewTextSetup(_ textView: UITextView, text: String) {
        textView.text = text
    }
    
    func presentActivityVC(text: String,_ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: ["\(text)"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    func setupAnimation(_ views: [UIView]) {
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view.alpha = 1
            })
        }
    }
    
    func presentMailComposer(composeVC: MFMessageComposeViewController) {
        composeVC.body = "My Problem: "
        composeVC.recipients = ["+380992776090"]
    }
    
    func presentMessageComposer(composer: MFMailComposeViewController) {
        composer.setToRecipients(["zhbr282@gmail.com"])
        composer.setSubject("Tests Review")
        composer.setMessageBody("Here is my problem or review on this app article or articles", isHTML: false)
        composer.view.tintColor = .biologyGreenColor
    }
    
    func systemBackSetup(mainView: UIView, contentTextView: UITextView, switchTextView: UITextView, switchView: UIView) {
        mainView.viewSystemBack()
        
        contentTextView.systemTextColor()
        switchTextView.systemTextColor()
        
        switchView.viewSystemBack()
    }
    
    func setupAlpha(_ view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    func setupContentTextView(_ contentTextView: UITextView) {
        contentTextView.bigContentTextViewsPrefering(size: 21)
    }
}
