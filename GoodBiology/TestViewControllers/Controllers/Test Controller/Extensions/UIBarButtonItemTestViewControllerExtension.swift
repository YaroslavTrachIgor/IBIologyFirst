//
//  UIBarButtonItem.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 25.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    func setupTestUIBarButtonItemImageFast(image: String) {
        if #available(iOS 13.0, *) {
            self.image = UIImage(systemName: image)
        }
    }
}
