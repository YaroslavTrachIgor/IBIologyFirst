//
//  ViewCostomTabBar.swift
//  GoodSolarSistem
//
//  Created by Yaroslav Trach on 11/17/18.
//  Copyright © 2018 Yaroslav Trach. All rights reserved.
//

import UIKit

class ViewCostomTabBar: UITabBarController {
    
    var tabBarIteam = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarIteam.badgeColor = #colorLiteral(red: 0.9004502892, green: 0.8950977921, blue: 0.9045648575, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
}
