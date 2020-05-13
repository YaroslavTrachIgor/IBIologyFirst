//
//  TestReviewVCViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 16.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class TestReviewVCViewModel {
    func setHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func setAlpha(_ view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    func setEnabled(_ button: UIBarButtonItem, enabled: Bool) {
        button.isEnabled = enabled
    }
    
    func presentActivityVC(textViewText: String, labelText: String,_ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [
            """
            \(labelText)
            
            \(textViewText)
            """], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    func setNavBarTintColor(navBar: UINavigationBar) {
        navBar.tintColor = .biologyGreenColor
    }
    
    func switchTextViewFontSetup(textView: UITextView) {
        textView.font = UIFont(name: BasicFonts.mediumFont, size: 14)
    }
    
    func setCorners(_ view: UIView, corner: CGFloat) {
        view.layer.cornerRadius = corner
    }
    
    func mailComposerSetup(composer: BasicMFMailComposeViewController) {
        composer.setSubject("Tests Review")
        composer.setMessageBody("Here is my problem or review on this app test or tests", isHTML: false)
    }
    
    func systemColors(view: UIView, switchTextView: UITextView, testBackgroundView: UIView, switchView: UIView) {
        view.viewSystemBack()
        switchTextView.textSystemColor()
        switchTextView.backgroundColor = .systemBackground
        testBackgroundView.viewSystemBack()
        switchView.viewSystemBack()
    }
}
