//
//  UsersIconImageView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol UsersInfoViewProtocol {
    func setupImageView()
}

final class UsersIconImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
}

extension UsersIconImageView: UsersInfoViewProtocol {
    func setupImageView() {
        setupImage()
        setupShadow()
        setupCornerRadius()
        setupBorder()
        setupTransform()
    }
}

extension UsersIconImageView {
    private func setupBorder() {
        
        /// Setup Border
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
    }
    
    private func setupCornerRadius() {
        
        /// Setup cornerRadius
        layer.cornerRadius = self.frame.height / 2
    }
    
    private func setupShadow() {
        
        /// Setup Shadow
        imageViewShadow()
    }
    
    private func setupImage() {
        
        /// Setup Image
        if #available(iOS 13.0, *) {
            image = UIImage(named: "Avatar 1")
        }
    }
    
    private func setupTransform() {
        transform = CGAffineTransform(scaleX: 0, y: 0)
    }
}
