//
//  NoteCopiedView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol NoteCopiedViewProtocol {
    func setupView()
}

final class NoteCopiedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension NoteCopiedView: NoteCopiedViewProtocol {
    func setupView() {
        setupBorder()
        setupCorners()
        setupBackgroundColor()
        setupHiddenAndAlpha()
    }
}

extension NoteCopiedView {
    private func setupBorder() {
        layer.cornerRadius = 3
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupCorners() {
        layer.borderWidth = 2
    }
    
    private func setupBackgroundColor() {
        backgroundColor = #colorLiteral(red: 0.2310164321, green: 0.2501265394, blue: 0.2778887783, alpha: 1)
    }
    
    private func setupHiddenAndAlpha() {
        alpha = 0
        isHidden = true
    }
}
