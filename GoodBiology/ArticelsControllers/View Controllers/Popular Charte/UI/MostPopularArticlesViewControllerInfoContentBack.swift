//
//  MostPopularArticlesViewControllerInfoContentBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 23.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MostPopularArticlesViewControllerInfoContentBackProtocol {
    func setupView()
}

final class MostPopularArticlesViewControllerInfoContentBack: ContentBack {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
}

extension MostPopularArticlesViewControllerInfoContentBack: MostPopularArticlesViewControllerInfoContentBackProtocol {
    
    func setupView() {
        setupHidden()
        setupShadow()
        setuoCornerRadius()
    }
}

extension MostPopularArticlesViewControllerInfoContentBack {
    private func setupHidden() {
        isHidden = true
    }
    
    private func setupShadow() {
        viewShadows()
    }
    
    private func setuoCornerRadius() {
        layer.cornerRadius = 15
    }
}
