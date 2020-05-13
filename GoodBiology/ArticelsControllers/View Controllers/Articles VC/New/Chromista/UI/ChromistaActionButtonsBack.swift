//
//  ChromistaActionButtonsBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ChromistaActionButtonsBackProtocol {
    func setupView()
}

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
}

extension ChromistaActionButtonsBack: ChromistaActionButtonsBackProtocol {
    func setupView() {
        setupShadow()
        setupBack()
        setupCorners()
    }
}

extension ChromistaActionButtonsBack {
    func setupShadow() {
        viewShadows()
        
        layer.shadowRadius = 17
        layer.shadowColor  = #colorLiteral(red: 0.8251903553, green: 0.8251903553, blue: 0.8251903553, alpha: 1)
    }
    
    func setupBack() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        }
        alpha = 0
    }
    
    func setupCorners() {
        layer.cornerRadius = 18
    }
}
