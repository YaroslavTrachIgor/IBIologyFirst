//
//  AddCostomArticleButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 22.06.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: AddCostomArticleButtonSetupProtocol protocol
protocol AddCostomArticleButtonSetupProtocol {
    func setupButton()
}



//MARK: AddCostomArticleButton main class
final class AddCostomArticleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
}



//MARK: AddCostomArticleButtonSetupProtocol extension
extension AddCostomArticleButton: AddCostomArticleButtonSetupProtocol {
    func setupButton() {
        setupShadow()
        setupCorners()
    }
}



//MARK: AddCostomArticleButton extension
extension AddCostomArticleButton {
    private func setupShadow() {
        buttonsShadows()
    }
    
    private func setupCorners() {
        layer.cornerRadius = 8
    }
}
