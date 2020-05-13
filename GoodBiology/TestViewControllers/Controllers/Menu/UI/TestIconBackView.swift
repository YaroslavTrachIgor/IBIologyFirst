//
//  TestIconBackView.swift
//  GoodBiology
//
//  Created by Yaroslav on 06.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// Test Icon Back View Setup and Delegate
protocol TestIconBackViewDelegate {
    func setupBackView()
}

class TestIconBackView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupBackView()
    }
}

extension TestIconBackView: TestIconBackViewDelegate {
    internal func setupBackView() {
        preferingViews()
        shadowsSetup()
        cornersSetup()
        backgroundColorSetup()
    }
}

extension TestIconBackView {
    func cornersSetup() {
        layer.cornerRadius = 25
    }
    
    func shadowsSetup() {
        setupBackPreviewViewShadow()
    }
    
    func backgroundColorSetup() {
        setupBackPreviewBackgroundColor()
    }
}

extension UIView {
    func setupBackPreviewViewShadow() {
        viewShadows()
    }
    
    func setupBackPreviewBackgroundColor() {
        backgroundColor = #colorLiteral(red: 0.9796359454, green: 0.9796359454, blue: 0.9796359454, alpha: 1)
    }
}
