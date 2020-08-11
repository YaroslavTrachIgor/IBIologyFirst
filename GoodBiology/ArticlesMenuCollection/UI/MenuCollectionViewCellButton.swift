//
//  MenuCollectionViewCellButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - MenuCollectionViewCellButtonProtocol setup
protocol MenuCollectionViewCellButtonProtocol {
    func setupView()
}



//MARK: - Main class
final class MenuCollectionViewCellButton: UIButton {
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: - MenuCollectionViewCellButtonProtocol
extension MenuCollectionViewCellButton: MenuCollectionViewCellButtonProtocol {
    func setupView() {
        setupTitleColor()
    }
}



//MARK: - Main Functions
extension MenuCollectionViewCellButton {
    private func setupTitleColor() {
        titleLabel?.textColor = .biologyGreenColor
    }
}

