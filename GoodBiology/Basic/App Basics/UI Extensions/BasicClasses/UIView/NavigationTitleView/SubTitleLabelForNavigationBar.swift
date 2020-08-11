//
//  SubTitleLabelForNavigationBar.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - SubTitleLabelForNavigationBarProtocol protocol
protocol SubTitleLabelForNavigationBarProtocol {
    func setupLabel()
}



//MARK: - SubTitleLabelForNavigationBar main class
class SubTitleLabelForNavigationBar: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
}



//MARK: - SubTitleLabelForNavigationBarProtocol extension
extension SubTitleLabelForNavigationBar: SubTitleLabelForNavigationBarProtocol {
    func setupLabel() {
        
        //Set textColor
        textColor = .systemGray
        
        //Set font
        font = UIFont(name: "AvenirNext-Medium", size: 12)
    }
}
