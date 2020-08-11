//
//  UIStepper.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Setup UIStepper basics
extension UIStepper {
    public func stepperBaics() {
        self.tintColor          = .biologyGreenColor
        self.layer.cornerRadius = 5
        self.stepperShadow()
    }
}
