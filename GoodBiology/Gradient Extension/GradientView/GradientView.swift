//
//  GradientView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    public let gradientLayer = CAGradientLayer()
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    @IBInspectable private var middleColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        self.layer.cornerRadius = 4
        
        setupGradientColors()
    }
    
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor, let middleColor = middleColor {
            gradientLayer.colors = [startColor.cgColor, middleColor.cgColor, endColor.cgColor]
        }
    }
}
