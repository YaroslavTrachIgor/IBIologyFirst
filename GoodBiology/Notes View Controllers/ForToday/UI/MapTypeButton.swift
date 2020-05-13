//
//  MapTypeButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol MapTypeButtonProtocol {
    func setupButton()
}

class MapTypeButton: UIBarButtonItem {
    override init() {
        super.init()
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}

extension MapTypeButton: MapTypeButtonProtocol {
    func setupButton() {
        setupTint()
        setupImage()
    }
}

extension MapTypeButton {
    private func setupTint() {
        tintColor = .biologyGreenColor
    }
    
    private func setupImage() {
        let image = "map"
        
        if #available(iOS 13.0, *) {
            self.image = UIImage(systemName: image)
        }
    }
}
