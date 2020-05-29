//
//  ChromistaTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

final class ChromistaTableViewController: UITableViewController {
    
    //MARK: Overrides
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ChromistaData.chromistaTitle.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChromistaCell", for: indexPath)
        cell.textLabel?.text = ChromistaData.chromistaTitle[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ChromistaData.chromistaIndex = indexPath.row
        performSegue(withIdentifier: "chsegue", sender: self)
    } 
}
