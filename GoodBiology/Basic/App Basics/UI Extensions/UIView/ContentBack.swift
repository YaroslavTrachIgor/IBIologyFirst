//
//  ContentBack.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ContentBack: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }

    private func setupView() {
        cornerRadius = 20
        
        if #available(iOS 13.0, *) {
            backgroundColor     = .systemBackground
        }
        layer.cornerRadius  = cornerRadius
        
        viewShadows()
    }
}
