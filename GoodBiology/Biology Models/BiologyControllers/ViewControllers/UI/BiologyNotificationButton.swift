//
//  BiologyNotificationButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BiologyNotificationButtonDelegate {
    func setup()
}

class BiologyNotificationButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}

extension BiologyNotificationButton: BiologyNotificationButtonDelegate {
    func setup() {
        notificationButtonBasics()
        
        alpha     = 0
        transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
}
