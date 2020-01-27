//
//  VideosMenuTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class VideosMenuTableViewController: UITableViewController {

    @IBOutlet weak var table: UITableView!
    
    private let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        
        return refreshControl
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControlPrefering()
        preferingSearchController()
        searchBarButtonPrefering()
    }
    
    private func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
               buttonItem.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        }
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        
        let searchTextAppearance      = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            searchTextAppearance.font = UIFont(name: "AvenirNext-Medium", size: 14)
        
        navigationItem.searchController = searchController
    }
        
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
}

extension VideosMenuTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}
