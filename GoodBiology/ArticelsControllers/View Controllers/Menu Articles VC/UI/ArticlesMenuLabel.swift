//
//  ArticlesMenuLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol ArticlesMenuLabelProtocol {
    func labelSetup()
}

class ArticlesMenuLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        labelSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        labelSetup()
    }
}

extension ArticlesMenuLabel: ArticlesMenuLabelProtocol {
    func labelSetup() {
        textColor = lazyColor
        
        labelShadow()
    }
}
