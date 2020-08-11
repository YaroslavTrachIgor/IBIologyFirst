//
//  DoneLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 05.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol DoneLabelProtocol {
    func setupLabel()
}

final class DoneLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}

extension DoneLabel: DoneLabelProtocol {
    func setupLabel() {
        font        = UIFont(name: "HelveticaNeue-Bold", size: 18)
        textColor   = .biologyGreenColor
    }
}
