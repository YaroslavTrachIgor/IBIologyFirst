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

//MARK: - ArticleVCViewModelUIBasicsProtocol protocol
protocol ArticleVCViewModelUIBasicsProtocol {
    func presentActivityVC(text: String,_ vc: UIViewController)
    func presentMailComposer(composeVC: MFMessageComposeViewController)
    func presentMessageComposer(composer: MFMailComposeViewController)
    func systemBackSetup(mainView: UIView, contentTextView: UITextView, switchTextView: UITextView, switchView: UIView)
    func setupContentTextView(_ contentTextView: UITextView)
}



//MARK: - ArticleVCViewModelBasicsProtocol protocol
protocol ArticleVCViewModelBasicsProtocol: ArticleVCViewModelUIBasicsProtocol {
    func setEnabled(_ button: UIButton, enabled: Bool)
    func setEnabled(_ barButton: UIBarButtonItem, enabled: Bool)
    func viewHidden(_ view: UIView, hidden: Bool)
    func setupAnimation(_ views: [UIView])
    func setupAlpha(_ view: UIView, alpha: CGFloat)
}



//MARK: - ArticleVCViewModel main class
final class ArticleVCViewModel {
    
    //MARK: ArticleVCViewModelBasicsProtocol functions
    public func setEnabled(_ button: UIButton, enabled: Bool) {
        button.isEnabled = enabled
    }
    
    public func setEnabled(_ barButton: UIBarButtonItem, enabled: Bool) {
        barButton.isEnabled = enabled
    }
    
    func viewHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    public func switchTextViewTextSetup(_ textView: UITextView, text: String) {
        textView.text = text
    }
    
    public func setupAlpha(_ view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    public func setupAnimation(_ views: [UIView]) {
        
        ///Setup animation
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view.alpha = 1
            })
        }
    }
    
    //MARK: ArticleVCViewModelUIBasicsProtocol functions
    public func presentActivityVC(text: String,_ vc: UIViewController) {
        
        ///Setup UIActivityViewController
        let activityVC = UIActivityViewController(activityItems: ["\(text)"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc.view
        
        ///Set UIApplication keyWindow tintColor
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        ///Present activityVC
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    public func presentMailComposer(composeVC: MFMessageComposeViewController) {
        
        ///Setup MessageComposer
        composeVC.body = "My Problem: "
        composeVC.recipients = ["+380992776090"]
    }
    
    public func presentMessageComposer(composer: MFMailComposeViewController) {
        
        ///Setup MailComposer
        composer.setToRecipients(["zhbr282@gmail.com"])
        composer.setSubject("Tests Review")
        composer.setMessageBody("Here is my problem or review on this app article or articles", isHTML: false)
        composer.view.tintColor = .biologyGreenColor
    }
    
    public func systemBackSetup(mainView: UIView, contentTextView: UITextView, switchTextView: UITextView, switchView: UIView) {
        
        ///Setup colors for darkMode
        mainView.viewSystemBack()
        contentTextView.systemTextColor()
        switchTextView.systemTextColor()
        switchView.viewSystemBack()
    }
    
    public func setupContentTextView(_ contentTextView: UITextView) {
        
        ///Setup ContentTextView
        contentTextView.bigContentTextViewsPrefering(size: 21)
    }
}
