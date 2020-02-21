//
//  NetworkingButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class NetworkingButton: UIBarButtonItem {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        barButtonItemSetup()
    }
    
    
    func barButtonItemSetup() {
        isEnabled = true
        tintColor = lazyColor
    }
}
