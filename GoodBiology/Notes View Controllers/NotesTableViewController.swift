//
//  NotesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController {

    var toDoItems : [Task] = []
    
    var filtredArray = [String]()
    
    @IBAction func addTaskItem(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Book Mark" , message: "Add a new book mark", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Create", style: .default) { action in
            
            let textField = alert.textFields?[0]
            
            self.saveTask(taskToDo: (textField?.text)!)
            //self.toDoItems.insert((textField?.text)!, at: 0)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addTextField {
            
            textField in
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveTask(taskToDo: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        
        taskObject.taskToDo = taskToDo
        
        do {
            try context.save()
            toDoItems.append(taskObject)
            print("Saved")
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = toDoItems[indexPath.row]
        cell.textLabel?.text = task.taskToDo
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchReqest : NSFetchRequest <Task> = Task.fetchRequest()
        
        do {
            
            toDoItems = try context.fetch(fetchReqest)
        } catch {
            
            print(error.localizedDescription)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
