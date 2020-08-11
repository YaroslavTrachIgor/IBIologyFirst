//
//  TextViewBackView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 05.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - TextViewBackViewProtocol protocol
protocol TextViewBackViewProtocol {
    func setupTextViewBack()
}



//MARK: - TextViewBackView main class
final class TextViewBackView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTextViewBack()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextViewBack()
    }
}



//MARK: - TextViewBackViewProtocol extension
extension TextViewBackView: TextViewBackViewProtocol {
    internal func setupTextViewBack() {
        alpha = 0
        layer.cornerRadius  = 20
        viewSystemBack()
        viewShadows()
    }
}
