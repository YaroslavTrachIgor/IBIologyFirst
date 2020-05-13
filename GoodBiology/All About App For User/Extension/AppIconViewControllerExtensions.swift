//
//  AppIconViewControllerExtensions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension AppIconViewController: AboutAppVCSetupProtocol {
    func setupVC() {
        switchViewPrefering()
        setupImageViewAlpha()
        systemColorsPrfering()
    }
}

extension AppIconViewController {
    
    // MARK: Private
    /// Setup SwithView
    private func switchViewPrefering() {
        switchLabel.text = "Hide Shadow"
        switchOutlet.switchBasics()
        switchView.editorsViews()
    }
    
    /// Setup imageView Alpha
    private func setupImageViewAlpha() {
        let alpha: CGFloat = 0
        
        imageView.alpha = alpha
    }
    
    /// Setup Colors for dark and light mode
    private func systemColorsPrfering() {
        if #available(iOS 13.0, *) {
            
            /// UILabel
            switchLabel.labelSystemColor()
            
            /// UIView
            switchView.viewSystemBack()
            view.viewSystemBack()
        }
    }
}
