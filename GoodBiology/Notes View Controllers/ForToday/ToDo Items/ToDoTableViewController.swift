//
//  ToDoTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    // MARK: - Model
    let model = ToDoItemsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addNewItem(_ sender: Any) {
        let alertController = UIAlertController(title: "Add new Item", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let addAction = UIAlertAction(title: "Create", style: .cancel) { (_) in
            self.model.addItem(nameItem: alertController.textFields![0].text!)
            self.tableView.reloadData()
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "New Item Name"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        present(alertController, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.toDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "ToDoTableViewController", bundle: nil), forCellReuseIdentifier: "ToDoTableViewController")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewControllerCell", for: indexPath)
        let currentItem = model.toDoItems[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        model.changeState(at: indexPath.row)
        tableView.reloadData()
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
