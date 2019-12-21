//
//  PlantsTable.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/5/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PlantsTable: UITableView {

    @IBOutlet weak var BasicsTextView: UITableViewCell!
    @IBOutlet weak var OthersTextViews: UITableViewCell!
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        
        switch segmentedController(<#T##sender: UISegmentedControl##UISegmentedControl#>) {
        case 0:
            <#code#>
        default:
            <#code#>
        }
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
