//
//  Test View.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol TestBackViewDelegate {
    func setupBackView()
}

class TestBackView: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupBackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupBackView()
    }
}

extension TestBackView: TestBackViewDelegate {
    internal func setupBackView() {
        layer.cornerRadius  = 16
        transform       = CGAffineTransform(scaleX: 0, y: 0)
        
        viewShadows()
        viewSystemBack()
    }
}
