//
//  RefreshControl.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class BasicRefreshControl: UIRefreshControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addTarget()
    }
    
    override init() {
        super.init()
        
        addTarget()
    }
    
    private func addTarget() {
        addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
    }
}
