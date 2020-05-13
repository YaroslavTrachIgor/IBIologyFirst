//
//  ExplanatoryView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ExplanatoryViewProtocol {
    func setupView()
}

class ExplanatoryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension ExplanatoryView: ExplanatoryViewProtocol {
    func setupView() {
        setupHidden()
    }
}

extension ExplanatoryView {
    private func setupHidden() {
        isHidden = true
    }
}

