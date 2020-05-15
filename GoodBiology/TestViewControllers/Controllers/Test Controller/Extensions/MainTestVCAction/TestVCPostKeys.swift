//
//  TestVCPostKeys.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Post Keys
extension TestViewController {
    
    //MARK: Public
    public func notificationCenterPost() {
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    public func notificationNameSet(name: String) {
        notificationName = Notification.Name(name)
    }
}
