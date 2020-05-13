//
//  SettingsTableViewControllerGesturesSetup.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension SettingsTableViewController {
    func gesturesSetup() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(hide))
        
        usersInfoView.addGestureRecognizer(gesture)
    }
}
