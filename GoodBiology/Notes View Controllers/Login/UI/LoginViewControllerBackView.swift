//
//  LoginViewControllerBackView.swift
//  GoodBiology
//
//  Created by Yaroslav on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: LoginViewControllerBackViewSetupProtocol protocol
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


//MARK: LoginViewControllerBackViewSetupProtocol
extension LoginViewControllerBackView: LoginViewControllerBackViewSetupProtocol {
    func setupView() {
        setupCorners()
        setupShadows(self)
    }
}



//MARK: LoginViewControllerBackView Main Functions
extension LoginViewControllerBackView {
    private func setupCorners() {
        layer.cornerRadius = 70
    }
}



//MARK: LoginViewControllerBackViewSetupProtocol extension
extension LoginViewControllerBackViewSetupProtocol {
    func setupShadows(_ view: UIView) {
        let offset = CGSize(width: .zero, height: 10)
        
        view.viewShadows()
        
        view.layer.shadowColor  = #colorLiteral(red: 0, green: 0.2075783085, blue: 0.008996214081, alpha: 1)
        view.layer.shadowRadius = 5.5
        view.layer.shadowOffset = offset
        
    }
}
