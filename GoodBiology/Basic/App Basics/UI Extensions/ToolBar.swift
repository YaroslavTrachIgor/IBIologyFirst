//
//  ToolBar.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - BasicToolbarProtocol protocol
protocol BasicToolbarProtocol {
    func sizeSetup()
    func tintSetup()
}



//MARK: - Basic UIToolbar main class
class BasicToolbar: UIToolbar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sizeSetup()
        tintSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        sizeSetup()
        tintSetup()
    }
}



//MARK: - BasicToolbarProtocol extension
extension BasicToolbar: BasicToolbarProtocol {
    func sizeSetup() {
        sizeToFit()
    }
    
    func tintSetup() {
        tintColor = .biologyGreenColor
    }
}
