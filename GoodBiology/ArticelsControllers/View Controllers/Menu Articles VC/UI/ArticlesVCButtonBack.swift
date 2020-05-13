//
//  ArticlesVCButtonBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ArticlesVCButtonBack: ChromistaActionButtonsBack {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        layer.shadowRadius = 26
        layer.shadowColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
