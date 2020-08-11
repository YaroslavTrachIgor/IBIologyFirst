//
//  ArticlesReviewViewControllerSwitch.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ArticlesReviewViewControllerSwitchSetupProtocol protocol
protocol ArticlesReviewViewControllerSwitchSetupProtocol {
    func setupSwitch()
}


//MARK: - ArticlesReviewViewControllerSwitchmain class
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


//MARK: - ArticlesReviewViewControllerSwitchSetupProtocol extension
extension ArticlesReviewViewControllerSwitch: ArticlesReviewViewControllerSwitchSetupProtocol {
    func setupSwitch() {
        switchShadow()
    }
}

