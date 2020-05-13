//
//  ChomistaViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ChomistaViewControllerViewModel {
    func contentSetup(_ textView: UITextView, content: String) {
        textView.text = content
    }
    
    func backViewSetup(mainView: UIView, navController: UINavigationController) {
        mainView.backgroundColor = .secondarySystemBackground
        navController.navigationBar.backgroundColor = .secondarySystemBackground
    }
    
    func setTextViewShadow(_ textView: UITextView) {
        textView.textViewShadow()
    }
    
    func cornersSetup(_ view: UIView) {
        view.layer.cornerRadius = 8
    }
    
    func alphaSetup(_ view: ContentBack) {
        view.alpha = 0
    }
    
    func chromistaVC_switchViewPropertiesSetup(switchOutlet: UISwitch, back: UIView) {
        back.isHidden = true
        switchOutlet.backgroundColor = .none
    }
    
    func setEditorsViewHideen_forShowingMethods(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
}
