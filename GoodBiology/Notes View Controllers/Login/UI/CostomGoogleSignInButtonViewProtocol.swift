//
//  CostomGoogleSignInButtonViewProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol CostomGoogleSignInButtonViewProtocol {
    func setupView()
}

class CostomGoogleSignInButtonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension CostomGoogleSignInButtonView: CostomGoogleSignInButtonViewProtocol {
    func setupView() {
        setupShadow()
        setupCorners()
        setupBack()
    }
}

extension CostomGoogleSignInButtonView {
    private func setupShadow() {
        viewShadows()
        
        layer.shadowColor  = UIColor.costomGoogleColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
    }
    
    private func setupCorners() {
        layer.cornerRadius = 16
    }
    
    private func setupBack() {
        backgroundColor = .costomGoogleColor
    }
}
