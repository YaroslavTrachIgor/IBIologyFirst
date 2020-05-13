//
//  LoginViewControllerBackView.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewControllerBackViewSetupProtocol {
    func setupView()
}

class LoginViewControllerBackView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}

extension LoginViewControllerBackView: LoginViewControllerBackViewSetupProtocol {
    
    func setupView() {
        setupCorners()
        setupShadows()
    }
}

extension LoginViewControllerBackView {
    
    func setupCorners() {
        layer.cornerRadius = 70
    }
    
    func setupShadows() {
        viewShadows()
    }
}
