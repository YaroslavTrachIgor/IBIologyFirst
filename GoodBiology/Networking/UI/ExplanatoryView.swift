//
//  ExplanatoryView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ExplanatoryViewProtocol protocol
protocol ExplanatoryViewProtocol {
    func setupView()
}



//MARK: - ExplanatoryView main class
final class ExplanatoryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
}



//MARK: - ExplanatoryViewProtocol extension
extension ExplanatoryView: ExplanatoryViewProtocol {
    internal func setupView() {
        setupHidden()
    }
}



//MARK: - ExplanatoryView main methods
extension ExplanatoryView {
    private func setupHidden() {
        isHidden = true
    }
}

