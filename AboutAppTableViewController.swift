//
//  AboutAppTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/1/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class AboutAppTableViewController: UITableViewController {
    
    @IBOutlet weak var Notificatiouttonn: UIButton!
    @IBOutlet weak var ItsTrue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Notificatiouttonn.layer.shadowColor = UIColor.darkGray.cgColor
        Notificatiouttonn.layer.shadowRadius = 4
        Notificatiouttonn.layer.shadowOpacity = 0.5
        Notificatiouttonn.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

}
