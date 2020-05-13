//
//  UIView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func preferingViews() {
        self.viewShadows()
        
        self.alpha = 0
        self.layer.cornerRadius = 12.87
    }
}
