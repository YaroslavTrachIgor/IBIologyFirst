//
//  AppDelegateViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class AppDelegateViewModel {
    func setUIWindowTintColor(_ window: UIWindow) {
        window.tintColor = .biologyGreenColor
    }
    
    func setupNavBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    func setupTabBar() {
        
        /// Hide Separator
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage     = UIImage()
        
        /// Set clipsToBounds
        UITabBar.appearance().clipsToBounds = true
        
        /// Set viewSystemBack
        UITabBar.appearance().viewSystemBack()
    }
    
    func setupUITabBarItem(font: UIFont) {
        let font: UIFont = font
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
}
