//
//  NewArticleLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 21.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol NewArticleLabelProtocol {
    func setupLabel()
}

class NewArticleLabel: UILabel {
    struct LabelProperties {
        static let font = "HelveticaNeue-Bold"
        static let text = " New Articles"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}

extension NewArticleLabel: NewArticleLabelProtocol {
    func setupLabel() {
        font = UIFont(name: LabelProperties.font, size: 23)
        text = LabelProperties.text
        
        if #available(iOS 13.0, *) {
            textColor = .systemGray
        }
        labelShadow()
        
        layer.shadowColor  = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.shadowRadius = 5
    }
}
