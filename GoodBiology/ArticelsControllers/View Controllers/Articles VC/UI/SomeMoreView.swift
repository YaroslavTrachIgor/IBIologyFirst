//
//  SomeMoreView.swift
//  GoodBiology
//
//  Created by Yaroslav on 14.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

class SomeMoreView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        alpha = 0
    }
}
