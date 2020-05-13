//
//  BarButtonItem.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestUIBarButtonItemDelegate {
    func setupButtonItem()
}

class TestUIBarButtonItem: UIBarButtonItem {
    override func awakeFromNib() {
        setupButtonItem()
    }
}

extension TestUIBarButtonItem: TestUIBarButtonItemDelegate {
    func setupButtonItem() {
        tintColor = .biologyGreenColor
    }
}
