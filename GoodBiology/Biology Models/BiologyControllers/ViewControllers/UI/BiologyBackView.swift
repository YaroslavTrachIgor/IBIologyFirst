//
//  BiologyBackView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BiologyBackViewSetupProtocol {
    func setupView()
}

class BiologyBackView: ContentBack {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
}

extension BiologyBackView: BiologyBackViewSetupProtocol {
    func setupView() {
        setupAlpha()
        setupCorners()
        setupShadow()
    }
}

extension BiologyBackView {
    private func setupAlpha() {
        viewSystemBack()
        
        alpha = 0
    }
    
    private func setupCorners() {
        layer.cornerRadius = 30
    }
    
    private func setupShadow() {
        viewShadows()
    }
}
