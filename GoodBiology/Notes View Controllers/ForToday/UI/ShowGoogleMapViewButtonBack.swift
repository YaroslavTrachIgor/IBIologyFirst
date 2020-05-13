//
//  ShowGoogleMapViewButtonBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ShowGoogleMapViewButtonBack: ContentBack {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        setupShadow()
        setupCornerRadius()
        hiddenSetup()
    }
}

extension ShowGoogleMapViewButtonBack {
    private func setupShadow() {
        viewShadows()
    }
    
    private func setupCornerRadius() {
        layer.cornerRadius = 12
    }
    
    private func hiddenSetup() {
        isHidden = true
    }
}
