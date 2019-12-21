//
//  TableViewPlants.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/18/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class TableViewPlants: UITableView {
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        
        let offSetY = -contentOffset.y
        
        height.constant = max(header.bounds.height, header.bounds.height + offSetY)
        
        
    }
    
}
