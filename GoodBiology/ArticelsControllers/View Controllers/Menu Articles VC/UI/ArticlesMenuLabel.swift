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
        textColorSetup()
        fontSetup()
    }
}

extension ArticlesMenuLabel {
    func textColorSetup() {
        let color = #colorLiteral(red: 0.1338435914, green: 0.1338435914, blue: 0.1338435914, alpha: 1)
        
        textColor = color
    }
    
    func fontSetup() {
        let fontName: String  = "HelveticaNeue-Bold"
        let fontSize: CGFloat = 23
        
        font = UIFont(name: fontName, size: fontSize)
    }
}
