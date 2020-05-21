//
//  SaveView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 20.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: SaveViewProtocol protocol
protocol SaveViewProtocol {
    func setupView()
}

class SaveView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: SaveViewProtocol
extension SaveView: SaveViewProtocol {
    func setupView() {
        
        /// Set corners
        layer.cornerRadius = 15
        
        /// Set constraints
        let active = true
        heightAnchor.constraint(equalToConstant: 400).isActive = active
        widthAnchor.constraint(equalToConstant: 320).isActive = active
    }
}



//MARK: Main Functions
extension SaveView {
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "SaveView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
