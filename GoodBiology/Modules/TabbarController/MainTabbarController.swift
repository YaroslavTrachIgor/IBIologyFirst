//
//  File.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-17.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class MainTabbarController: UITabBarController {
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    /// Customizing the appearance of the TabBar.
    private func setupTabBar() {
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .default
        self.tabBar.tintColor = .red
        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .blue
    }
}
