//
//  SomeMoreView.swift
//  GoodBiology
//
//  Created by Yaroslav on 14.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit
import Foundation

//MARK: - SomeMoreViewProtocol protocol
protocol SomeMoreViewProtocol {
    func setupView()
}



//MARK: - SomeMoreViewProtocol main class
final class SomeMoreView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: - SomeMoreViewProtocol extension
extension SomeMoreView: SomeMoreViewProtocol {
    func setupView() {
        alpha = 0
    }
}
