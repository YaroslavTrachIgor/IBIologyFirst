//
//  NewLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol NewLabelProtocol {
    func labelSetup()
}

class NewLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        labelSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        labelSetup()
    }
}

extension NewLabel: NewLabelProtocol {
    func labelSetup() {
        textColor = .systemRed
        
        shadowSetup()
    }
}

extension NewLabel {
    func shadowSetup() {
        labelShadow()
        
        layer.shadowRadius = 2
    }
}
