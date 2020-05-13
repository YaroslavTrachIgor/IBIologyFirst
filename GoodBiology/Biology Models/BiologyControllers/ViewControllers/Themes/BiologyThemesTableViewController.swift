//
//  BiologyThemesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension BiologyThemesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}

class BiologyThemesTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    lazy var settingsRefreshControl: BasicRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarSetup()
        preferingSearchController()
        refreshControlPrefering()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BiologyAllStringData.biologyTitlesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BiologyThemesTableViewControllerCell", for: indexPath)
        
        cell.textLabel?.text = BiologyAllStringData.biologyTitlesArray[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "\(BiologyAllStringData.biologyTitlesArray[indexPath.row]) of Biology"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BiologyAllStringData.index = indexPath.row
        performSegue(withIdentifier: "BiologySearchThemeSegue", sender: self)
    }
}



// MARK: - Main Functions
extension BiologyThemesTableViewController {
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
    
    private func navBarSetup() {
        let color: UIColor = .groupTableViewBackground
        
        navigationController?.navigationBar.barTintColor    = color
        navigationController?.navigationBar.backgroundColor = color
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}
