//
//  BiologyThemesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class BiologyThemesTableViewController: UITableViewController {
    
    // MARK: - UITableView
    @IBOutlet var table: UITableView!
    
    // MARK: - Content
    private let titleArray: [String] = BiologyAllStringData.biologyTitlesArray
    
    // MARK: - BasicSearchController
    private lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    // MARK: - BasicRefreshControl
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
    
    
    // MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return setupNumberOfRowsInSection()
    }
    

    // MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCell(indexPath: indexPath)
    }

    
    // MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupDestinationVCPresent(indexPath: indexPath)
    }
}



// MARK: - Main Functions
extension BiologyThemesTableViewController {
    
    //MARK: refreshControl setup
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
    
    
    //MARK: navigation Bar Setup
    private func navBarSetup() {
        let color: UIColor = .groupTableViewBackground
        
        navigationController?.navigationBar.barTintColor    = color
        navigationController?.navigationBar.backgroundColor = color
    }
    
    
    //MARK: prefering SearchController
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    
    //MARK: setup DestinationVC Present
    private func setupDestinationVCPresent(indexPath: IndexPath) {
        BiologyAllStringData.index = indexPath.row
        performSegue(withIdentifier: "BiologySearchThemeSegue", sender: self)
    }
    
    
    //MARK: setup Cell
    private func setupCell(indexPath: IndexPath) -> UITableViewCell {
        
        /// Setup tableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "BiologyThemesTableViewControllerCell", for: indexPath)
        
        /// Setup content
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.detailTextLabel?.text = "\(titleArray[indexPath.row]) of Biology"
        
        /// Setup accessory Type
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    //MARK: setup Number Of Rows In Section
    private func setupNumberOfRowsInSection() -> Int {
        return titleArray.count
    }
}



// MARK: - UISearchResultsUpdating
extension BiologyThemesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}
