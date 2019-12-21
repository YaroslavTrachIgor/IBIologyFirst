//
//  LaunchTabBar.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class LaunchTabBar: UITabBarController {

    override func viewDidLoad() {
        UITabBar.appearance().backgroundImage   = UIImage()
        UITabBar.appearance().shadowImage       = UIImage()
        UITabBar.appearance().clipsToBounds     = true
    }
}
