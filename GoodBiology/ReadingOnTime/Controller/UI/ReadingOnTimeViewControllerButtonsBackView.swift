//
//  ReadingOnTimeViewControllerButtonsBackView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 06.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ReadingOnTimeViewControllerButtonsBackViewSetupProtocol {
    func setupView()
}

final class ReadingOnTimeViewControllerButtonsBackView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension ReadingOnTimeViewControllerButtonsBackView: ReadingOnTimeViewControllerButtonsBackViewSetupProtocol {
    func setupView() {
        setupShadow()
        setupAlpha()
        setupBackgroundColor()
        setupCornerRadius()
    }
}

extension ReadingOnTimeViewControllerButtonsBackView {
    private func setupShadow() {
        layer.shadowColor  = #colorLiteral(red: 0.02475117366, green: 0.39891678, blue: 0.1420775023, alpha: 1)
        layer.shadowRadius = 30
    }
    
    private func setupAlpha() {
        alpha = 0
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .biologyGreenColor
    }
    
    private func setupCornerRadius() {
        layer.cornerRadius = 12
    }
}
