//
//  MenuCellRightView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MenuCellRightViewProtocol {
    func setupView(view alpha: CGFloat)
}

class MenuCellRightView: GradientView {
    let viewAlpha: CGFloat = 0.91
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(view: viewAlpha)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView(view: viewAlpha)
    }
}

extension MenuCellRightView: MenuCellRightViewProtocol {
    func setupView(view alpha: CGFloat) {
        self.alpha = alpha
        
        viewShadows()
    }
}
