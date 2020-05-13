//
//  ArticlesReviewViewControllerIconImageView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticlesReviewViewControllerIconImageViewSetupProtocol {
    func setupImageView()
}

class ArticlesReviewViewControllerIconImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}

extension ArticlesReviewViewControllerIconImageView: ArticlesReviewViewControllerIconImageViewSetupProtocol {
    
    func setupImageView() {
        setupBorder()
        setupCorner()
        setupMasksToBounds()
        setupShadow()
    }
}

extension ArticlesReviewViewControllerIconImageView {
    
    func setupCorner() {
        layer.cornerRadius = 50
    }
    
    func setupMasksToBounds() {
        layer.masksToBounds = true
    }
    
    func setupBorder() {
        layer.borderColor     = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        layer.borderWidth     = 11
    }
    
    func setupShadow() {
        imageViewShadow()
    }
}
