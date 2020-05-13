//
//  BlankSheetViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class BlankSheetViewControllerViewModel {
    func setTextViewText(_ textView: UITextView, text: String) {
        textView.text = text
    }
    
    func setTextFieldText(_ textField: UITextField, text: String) {
        textField.text = text
    }
    
    func setTextViewFont(_ textView: UITextView, font: UIFont) {
        textView.font = font
    }
    
    func share(_ text: String, vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems:
            [text], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc.view
        
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    func setCorner(_ view: UIView, corner: CGFloat) {
        view.layer.cornerRadius = corner
    }
    
    func textFieldTintSetup(_ textField: UITextField, tint: UIColor) {
        textField.tintColor = tint
    }
    
    func navItemSetup(_ navigationItem: UINavigationItem) {
        navigationItem.setTitle("Blank Sheet", subtitle: "For Today Section")
        navigationItem.title = ""
    }
    
    func setupInputAccessoryViews(textView: UITextView, textField: UITextField, accessoryView: UIView) {
        textView.inputAccessoryView  = accessoryView
        textField.inputAccessoryView = accessoryView
    }
    
    func endEditing(_ view: UIView) {
        view.endEditing(true)
    }
    
    func setHidden(for view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
}
