//
//  UISwitch.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Setup UISwitch basics
extension UISwitch {
    public func switchBasics() {
        self.isOn               = true
        self.layer.cornerRadius = 1
        self.thumbTintColor     = .white
        self.onTintColor        = .biologyGreenColor
        self.switchShadow()
    }
}
