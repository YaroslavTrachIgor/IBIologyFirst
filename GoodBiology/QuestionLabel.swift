//
//  QuestionLabel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 25.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionLabelSetupProtocol {
    func setupLabel()
}

final class QuestionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
}

extension QuestionLabel: QuestionLabelSetupProtocol {
    func setupLabel() {
        setupFont()
        setupTextColor()
    }
}

extension QuestionLabel {
    private func setupFont() {
        let font = UIFont(name: "HelveticaNeue-Medium", size: 15.5)
        self.font = font
    }
    
    private func setupTextColor() {
        textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}
