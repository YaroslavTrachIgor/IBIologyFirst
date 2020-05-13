//
//  ReviewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension TestsReviewViewController: ReviewControllerViewSetupProtocol {
    func alphaSetup() {
        let alpha = 0
        
        sendButton.alpha           = CGFloat(alpha)
        contentTextView.alpha      = CGFloat(alpha)
        headLineTextView.alpha     = CGFloat(alpha)
        testBackgroundView.alpha   = CGFloat(alpha)
    }
    
    // View Setup Start
    func viewSetup() {
        testBackgroundViewSetup()
        contentTextViewSetup()
        navigationControllerTintSetup()
        switchViewSetup()
        switchOutletSetup()
        switchTextViewSetup()
        
        // Methods From This Protocol
        alphaSetup()
        systemBackSetup()
    }
    
    private func testBackgroundViewSetup() {
        testBackgroundView.viewShadows()
    }
    
    private func contentTextViewSetup() {
        contentTextView.bigContentTextViewsPrefering(size: 18.7)
    }
    
    private func navigationControllerTintSetup() {
        navigationController?.navigationBar.tintColor = .biologyGreenColor
    }
    
    private func switchViewSetup() {
        switchView.isHidden = true
        switchView.editorsViews()
        switchTextViewSetup()
        switchOutletSetup()
    }
    
    private func switchOutletSetup() {
        switchOutlet.switchBasics()
    }
    
    private func switchTextViewSetup() {
        switchTextView.switchTextViewPrefering()
        switchTextView.font = UIFont(name: BasicFonts.mediumFont, size: 14)
    }
    // View Setup Start End
    
    func systemBackSetup() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            switchTextView.textSystemColor()
            switchTextView.backgroundColor = .systemBackground
            testBackgroundView.viewSystemBack()
            switchView.viewSystemBack()
        }
    }
}

