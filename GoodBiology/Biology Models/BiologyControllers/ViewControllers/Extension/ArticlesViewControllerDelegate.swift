//
//  ArticlesViewControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension BasicsViewController: ArticlesViewControllerDelegate {
    func finalView() {
        view.viewGradient()
        
        rate()
        editorsViewSetup()
        prepareBackgroundView()
        modelsPrefering()
        contentTextViewFontPrefering()
        viewBasics()
    }
}
