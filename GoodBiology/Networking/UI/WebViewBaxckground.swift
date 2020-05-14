//
//  WebViewBaxckground.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 22.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol WebViewBaxckgroundProtocol {
    func setupView()
}

class WebViewBaxckground: ContentBack {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
}

extension WebViewBaxckground: WebViewBaxckgroundProtocol {
    func setupView() {
        layer.shadowColor  = UIColor.clear.cgColor
        layer.shadowRadius = 0
    }
}
