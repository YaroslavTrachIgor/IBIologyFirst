//
//  PlantsTestTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/11/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class PlantsTestTableViewController: UITableViewController {

    
    @IBAction func PlantsDoneAlert(_ sender: Any)
    {
        let alertController = UIAlertController(title: "Good", message: "You're pass the tes", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        {
            (action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

}
