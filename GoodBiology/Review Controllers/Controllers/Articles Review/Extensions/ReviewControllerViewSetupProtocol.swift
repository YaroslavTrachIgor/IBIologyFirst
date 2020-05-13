//
//  ReviewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// MARK: ReviewControllerViewSetupProtocol
extension ArticlesReviewViewController: ReviewControllerViewSetupProtocol {
    func systemBackSetup() {
        viewModel.systemBackSetup(mainView: view, contentTextView: contentTextView, switchTextView: switchTextView, switchView: switchView)
    }
    
    func alphaSetup() {
        let alpha: CGFloat = 0
        
        viewModel.setupAlpha(contentTextView, alpha: alpha)
        viewModel.setupAlpha(switchTextView,  alpha: alpha)
        viewModel.setupAlpha(imageView,       alpha: alpha)
    }
    
    func viewSetup() {
        contentBackgroundViewPrefering()
        contentTextViewSetup()
    }
    
    private func contentBackgroundViewPrefering() {
        viewModel.setupAlpha(contentBackgroundView, alpha: 0)
        contentTextViewSetup()
    }
    
    private func contentTextViewSetup() {
        viewModel.setupContentTextView(contentTextView)
    }
}
