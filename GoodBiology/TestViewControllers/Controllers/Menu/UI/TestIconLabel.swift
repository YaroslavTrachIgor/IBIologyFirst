//
//  TestIconLabel.swift
//  GoodBiology
//
//  Created by Yaroslav on 06.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Test Icon Labels
protocol TestIconLabelDelegate {
    func setupAnswerLabel()
}

class TestIconLabel: UILabel {
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupAnswerLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupAnswerLabel()
    }
}

extension TestIconLabel: TestIconLabelDelegate {
    internal func setupAnswerLabel() {
        labelShadow()
        
        textColor = lazyColor
    }
}
