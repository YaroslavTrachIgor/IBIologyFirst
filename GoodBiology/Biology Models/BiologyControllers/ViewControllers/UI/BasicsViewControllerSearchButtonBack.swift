//
//  BasicsViewControllerSearchButtonBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class BasicsViewControllerSearchButtonBack: ChromistaActionButtonsBack {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSearchButtonBack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupSearchButtonBack()
    }
}

extension BasicsViewControllerSearchButtonBack {
    private func setupSearchButtonBack() {
        layer.cornerRadius = 15
        
        layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowRadius  = 15
    }
}
