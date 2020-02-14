//
//  UIBarButtonItem.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension UIBarButtonItem {
    // Basics for All UIBarButtonItems fot Tests
    
    public func testBarButtonItemsTint() {
        self.tintColor = lazyColor
    }
    
    public func shareAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
    }
}
