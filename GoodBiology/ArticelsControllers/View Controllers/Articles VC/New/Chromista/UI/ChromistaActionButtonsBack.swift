//
//  ChromistaActionButtonsBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// buttons Back shadow views
class ChromistaActionButtonsBack: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }

    private func setupView() {
        backgroundColor     = .systemBackground
        layer.cornerRadius  = 16
        alpha = 0
        
        viewShadows()
    }
}

