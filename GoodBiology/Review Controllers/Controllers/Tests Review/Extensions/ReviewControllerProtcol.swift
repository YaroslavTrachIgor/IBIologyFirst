//
//  ReviewControllerProtcol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension TestsReviewViewController: ReviewControllerProtcol {
    func basicViewProcessesPrefering() {
        cornersPrefering()
        viewBasicsPrefering()
    }
    
    func cornersPrefering() {
        let cornerRadius: CGFloat = 12
        
        switchView.layer.cornerRadius     = cornerRadius
        switchTextView.layer.cornerRadius = cornerRadius
        
        testBackgroundView.layer.cornerRadius  = 19.4
    }
}

