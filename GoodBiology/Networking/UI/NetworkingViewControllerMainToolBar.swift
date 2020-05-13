//
//  NetworkingViewControllerMainToolBar.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 22.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkingViewControllerMainToolBarProtocol {
    func setupToolbar()
}

class NetworkingViewControllerMainToolBar: UIToolbar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupToolbar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupToolbar()
    }
}

extension NetworkingViewControllerMainToolBar: NetworkingViewControllerMainToolBarProtocol {
    func setupToolbar() {
        barTintColor = .white
        setShadowImage(UIImage(), forToolbarPosition: .any)
    }
}
