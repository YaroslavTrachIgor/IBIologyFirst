//
//  UsersInfoView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol UsersInfoViewSetupProtocol {
    func setupView()
}

class UsersInfoView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension UsersInfoView: UsersInfoViewSetupProtocol {
    func setupView() {
        userInteractionSetup()
        setupBackgroung()
        setupShadow()
    }
}

extension UsersInfoView {
    private func setupShadow() {
        viewShadows()
        
        layer.shadowColor = #colorLiteral(red: 0.7549843976, green: 0.7549843976, blue: 0.7549843976, alpha: 1)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 15
    }
    
    private func setupBackgroung() {
        backgroundColor = .groupTableViewBackground
        
        alpha = 0
    }
    
    private func userInteractionSetup() {
        isUserInteractionEnabled = true
    }
}
