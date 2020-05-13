//
//  ArticlesReviewViewControllerSwitch.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticlesReviewViewControllerSwitchSetupProtocol {
    func setupSwitch()
}

class ArticlesReviewViewControllerSwitch: UISwitch {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSwitch()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupSwitch()
    }
}

extension ArticlesReviewViewControllerSwitch: ArticlesReviewViewControllerSwitchSetupProtocol {
    
    func setupSwitch() {
        switchShadow()
    }
}

