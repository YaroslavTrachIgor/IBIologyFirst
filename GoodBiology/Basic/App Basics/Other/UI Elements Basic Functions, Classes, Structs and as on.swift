//
//  UI Basic Functions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

import UIKit

public func viewDidLoadPrinting(doing: String) {
    print("View of \(doing) article was done.")
}

@available(iOS 13.0, *)
class AppleButtonSettings {
    var titleColor      = UIColor.label
    var backgroundColor = UIColor.systemGray6
    
    var appleButtonCornerRadius = cornerRadius
    
    var font = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(14.5))
}
