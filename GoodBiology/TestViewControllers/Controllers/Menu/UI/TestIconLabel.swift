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
    func labelSetup()
}

class TestIconLabel: UILabel {
    override init(frame: CGRect) {
      super.init(frame: frame)
        labelSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        labelSetup()
    }
}

extension TestIconLabel: TestIconLabelDelegate {
    func labelSetup() {
        textColorSetup()
        fontSetup()
    }
}

extension TestIconLabel {
    func textColorSetup() {
        let color = #colorLiteral(red: 0.1338435914, green: 0.1338435914, blue: 0.1338435914, alpha: 1)
        
        textColor = color
    }
    
    func fontSetup() {
        let fontName: String  = "HelveticaNeue-Bold"
        let fontSize: CGFloat = 21.5
        
        font = UIFont(name: fontName, size: fontSize)
    }
}
