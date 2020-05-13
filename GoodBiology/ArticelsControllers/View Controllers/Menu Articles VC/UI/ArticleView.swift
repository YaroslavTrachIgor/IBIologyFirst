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

class ArticleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        viewPrefering()
        viewBackColor()
    }
}

extension ArticleView: ArticleViewProtocol {
    func viewPrefering() {
        preferingViews()
    }
    
    func viewBackColor() {
        viewSystemBack()
    }
}
