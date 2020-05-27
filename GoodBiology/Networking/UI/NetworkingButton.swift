//
//  NetworkingButton.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: NetworkingButtonProtocol protocol
protocol NetworkingButtonProtocol {
    func barButtonItemSetup()
}



//MARK: NetworkingButton main class
class NetworkingButton: UIBarButtonItem {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        barButtonItemSetup()
    }
}



//MARK: NetworkingButtonProtocol extension
extension NetworkingButton: NetworkingButtonProtocol {
    func barButtonItemSetup() {
        
        /// Setup Enabled
        isEnabled = true
        
        /// Setup tintColor
        tintColor = .black
    }
}
