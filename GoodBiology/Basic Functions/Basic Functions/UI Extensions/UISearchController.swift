//
//  UISearchController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class IBiologySearchBar: UISearchController {
    searchResultsUpdater           = self
    searchBar.barStyle             = .default
    searchBar.searchBarStyle       = .minimal
    view.tintColor                 = lazyColor
    searchBar.clipsToBounds        = true
    
    let searchTextAppearance      = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.font = UIFont(name: "AvenirNext-Medium", size: 14)
}

extension IBiologySearchBar: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}
