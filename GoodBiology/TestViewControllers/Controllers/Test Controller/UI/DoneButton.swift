//
//  DoneButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 21.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol DoneButtonProtocol {
    func setupButton()
}

final class DoneButton: UIBarButtonItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension DoneButton: DoneButtonProtocol {
    func setupButton() {
        tintColor = .biologyGreenColor
        setupTestUIBarButtonItemImageFast(image: "checkmark.circle")
    }
}
