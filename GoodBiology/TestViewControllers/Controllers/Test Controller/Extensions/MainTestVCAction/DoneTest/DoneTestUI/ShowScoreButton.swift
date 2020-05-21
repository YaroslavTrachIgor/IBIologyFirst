//
//  ShowScoreButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ShowScoreButtonProtocol {
    func setupButton()
}


class ShowScoreButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}



//MARK: ShowScoreButtonProtocol
extension ShowScoreButton: ShowScoreButtonProtocol {
    func setupButton() {
        
        /// Set corner radius
        layer.cornerRadius = 15
        
        /// Set Border
        layer.borderColor = #colorLiteral(red: 0.001704043563, green: 0.2293898567, blue: 0.01272875352, alpha: 1)
        layer.borderWidth = 1.5
    }
}
