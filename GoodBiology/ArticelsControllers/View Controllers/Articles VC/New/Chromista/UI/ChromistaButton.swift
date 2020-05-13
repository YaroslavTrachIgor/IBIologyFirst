//
//  ChromistaButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Buttons (size, hide functions)
class ChromistaButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension ChromistaButton: ChromistaButtonDelegate {
    func setup() {
        tintColor           = lazyColor
        layer.cornerRadius  = 16
    }
}

protocol ChromistaButtonDelegate {
    func setup()
}
