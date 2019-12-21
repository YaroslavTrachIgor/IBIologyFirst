//
//  SettingsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/1/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let plantsClass = PlantsViewController.init()
    
    @IBOutlet weak var notificationSettingsView: UIView!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBAction func notificationSettings(_ sender: UISwitch) {
        if sender.isOn == true {
            
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
