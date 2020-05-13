//
//  ToDoItemsModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

class ToDoItemsModel {
    let key = "toDoDataKey"
    var toDoItems: [[String: Any]] = [["Name": "jkvkwe.n", "isCompleted": false], ["Name": "ecw.n", "isCompleted": true]]
    
    func addItem(nameItem: String, isCompleted: Bool = false) {
        toDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
    }
    
    func removeItem(at index: Int) {
        toDoItems.remove(at: index)
    }
    
    func changeState(at item: Int) -> Bool {
        toDoItems[item]["isCompleted"] = !(toDoItems[item]["isCompleted"] as! Bool)
        return toDoItems[item]["isCompleted"] as! Bool
    }
    
    func saveData() {
        UserDefaults.standard.set(toDoItems, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        //if let array = UserDefaults.standard.array(forKey: key) as? [[String: Any]] {
        //    return array
        //} else {
        //    return []
        //}
    }
}
