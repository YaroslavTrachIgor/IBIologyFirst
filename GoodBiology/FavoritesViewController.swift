//
//  FavoritesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/24/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var array = ["Plants ", "Animals"]
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var edit: UIBarButtonItem!
    
    @IBOutlet weak var PlantsFirstInfo: UITableViewCell!
    @IBOutlet weak var PlantsFirstDelete: UITableViewCell!
    
    @IBAction func Edit(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
