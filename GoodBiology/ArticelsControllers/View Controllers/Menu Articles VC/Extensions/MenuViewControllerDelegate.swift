//
//  MenuViewControllerDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension ArticelsViewController: MenuViewControllerDelegate {
    func basicViewProccesPrefering() {
        preferingSearchController()
        systemColors()
        refreshControlPrefering()
        notificationAlert()
        articelsViewControllerTextViewSetup()
        setupSearchBarFont()
    }
}

