//
//  ReadingOnTimeButtonOnDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ReadingOnTimeStyleVaribles {
    static var backColor  = lazyColor
    static var titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static var border     = 3.5
}

protocol ReadingOnTimeButtosnProtocol {
    func buttonStyle()
}
