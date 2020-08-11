//
//  NetworkingViewControllerMainToolBar.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 22.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - NetworkingViewControllerMainToolBarProtocol protocol
protocol NetworkingViewControllerMainToolBarProtocol {
    func setupToolbar()
}


//MARK: - NetworkingViewControllerMainToolBar main class
final class NetworkingViewControllerMainToolBar: UIToolbar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupToolbar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupToolbar()
    }
}



//MARK: - NetworkingViewControllerMainToolBarProtocol extension
extension NetworkingViewControllerMainToolBar: NetworkingViewControllerMainToolBarProtocol {
    internal func setupToolbar() {
        barTintColor = .white
        setShadowImage(UIImage(), forToolbarPosition: .any)
    }
}
