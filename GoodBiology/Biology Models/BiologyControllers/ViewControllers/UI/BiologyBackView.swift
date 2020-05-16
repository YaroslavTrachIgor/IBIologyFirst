//
//  BiologyBackView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BiologyBackViewSetupProtocol {
    func setupView()
}

class BiologyBackView: ContentBack {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
}

extension BiologyBackView: BiologyBackViewSetupProtocol {
    func setupView() {
        setupAlpha()
        setupCorners()
        setupShadow()
    }
}

extension BiologyBackView {
    private func setupAlpha() {
        viewSystemBack()
        
        alpha = 0
    }
    
    private func setupCorners() {
        layer.cornerRadius = 30
    }
    
    private func setupShadow() {
        let shadowWidth: CGFloat = 1.25
        let shadowHeight: CGFloat = 0.5

        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 10 / 2, y: frame.height - 10 / 2))
        shadowPath.addLine(to: CGPoint(x: frame.width - 10 / 2, y: frame.height - 10 / 2))
        shadowPath.addLine(to: CGPoint(x: frame.width * shadowWidth, y: frame.height + (frame.height * shadowHeight)))
        shadowPath.addLine(to: CGPoint(x: frame.width * -(shadowWidth - 1), y: frame.height + (frame.height * shadowHeight)))
        layer.shadowPath = shadowPath.cgPath
        layer.shadowRadius = 10
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
    }
}
