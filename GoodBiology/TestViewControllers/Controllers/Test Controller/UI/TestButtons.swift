//
//  Button.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class TestButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            setup()
    }
}

extension TestButton: TestButtonDelegate {
    func setup() {
        testButtonsSetup()
    }
}

protocol TestButtonDelegate {
    func setup()
}

extension UIButton {
    func testButtonsSetup() {
        self.setTitleColor(lazyColor, for: .normal)
        self.titleLabel?.font       = UIFont(name: boldFont, size: 15)
        
        if #available(iOS 13.0, *) {
            self.backgroundColor        =  .systemBackground
        }
        
        self.titleLabel?.textColor  =  lazyColor
        
        self.layer.borderColor      =  #colorLiteral(red: 0.03378171101, green: 0.2793948948, blue: 0.1025686339, alpha: 1)
        self.layer.borderWidth      =  2.55
        
        layer.cornerRadius  = CGFloat(14)
        
        titleLabel?.labelShadow()
        titleLabel?.layer.shadowOpacity = Float(0.7)
        
        testButtonsShadows()
    }
}
