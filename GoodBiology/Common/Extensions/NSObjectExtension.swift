//
//  NSObjectExtension.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-11.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

public extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
