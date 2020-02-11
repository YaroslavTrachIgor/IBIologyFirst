//
//  TestLandingCell.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-09.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class TestLandingCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descrtiptionTextView:  UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(data: TestLandingRow) {
        titleLabel.text = data.title
        descrtiptionTextView.text = data.description
    }
}
