//
//  BasicNotesViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class BasicNotesViewControllerViewModel {
    func setupNavItem(navigationItem: UINavigationItem) {
        navigationItem.setTitle("Basic Notes", subtitle: "For Today")
        navigationItem.title = ""
    }
    
    func setViewAlpha(_ view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    func setViewHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func setButtonTitle(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func showActivityVC(content: String, _ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = vc.view

        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    func endEditing(_ view: UIView) {
        view.endEditing(true)
    }
    
    func setViewTint(_ view: UIView, tint: UIColor) {
        view.tintColor = tint
    }
    
    func setViewAffineTransform(_ view: UIView, scale: CGFloat) {
        view.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func setTextViewText(textView: UITextView, text: String) {
        textView.text = text
    }
    
    func setTextFieldText(textField: UITextField, text: String) {
        textField.text = text
    }
    
    func setupGoogleBanner(_ bunner: GADBannerView, unit: String, vc: UIViewController) {
        bunner.adUnitID = unit
        bunner.rootViewController = vc
        bunner.load(GADRequest())
    }
    
    func viewDidApearAnimation(_ objectsArray: [UIView]) {
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
    }
}
