//
//  ArticlesViewControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

extension ChomistaViewController: ArticlesViewControllerDelegate {
    func finalView() {
        shadowsSetup()
        cornersSetup()
        contentSetup()
        alphaSetup()
        switchViewPrefering()
        stepperViewPrefering()
        backViewSetup()
    }
}
