//
//  ThemesNavItem.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/12/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class ThemesNavItem: UINavigationItem {

    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater   = self
        navigationItem.searchController         = searchController
        searchController.searchControllerBasics()
    }
}

extension ThemesController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}
