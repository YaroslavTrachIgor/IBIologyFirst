//
//  View.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleViewProtocol {
    func viewPrefering()
    func viewBackColor()
}

class ArticlePreviewView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        viewBackColor()
        viewPrefering()
    }
}

extension ArticlePreviewView: ArticleViewProtocol {
    func viewPrefering() {
        
        // Set corners
        layer.cornerRadius = 12
        
        /// Set background Color
        backgroundColor = #colorLiteral(red: 0.9796359454, green: 0.9796359454, blue: 0.9796359454, alpha: 1)
        
        /// Set Alpha
        alpha = 0
    }
    
    func viewBackColor() {
        setupBackPreviewBackgroundColor()
        
        shadowsSetup()
    }
}

extension ArticlePreviewView {
    func shadowsSetup() {
        setupBackPreviewViewShadow()
    }
}
