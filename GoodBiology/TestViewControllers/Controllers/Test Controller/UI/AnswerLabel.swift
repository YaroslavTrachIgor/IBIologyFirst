//
//  Answer Label.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol AnswerLabelDelegate {
    func setupAnswerLabel()
}

class AnswerLabel: UILabel {
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupAnswerLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupAnswerLabel()
    }
}

extension AnswerLabel: AnswerLabelDelegate {
    internal func setupAnswerLabel() {
        transform    = CGAffineTransform(scaleX: 0, y: 0)
        labelShadow()
        font = UIFont(name: "AvenirNext-Bold", size: 20.5)
        labelSystemColor()
    }
}
