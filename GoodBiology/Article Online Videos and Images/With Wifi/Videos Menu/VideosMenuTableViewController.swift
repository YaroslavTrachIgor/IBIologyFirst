//
//  VideosMenuTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 02.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

//MARK: - VideosMenuTableViewControllerProtocol protocol
protocol VideosMenuTableViewControllerProtocol {
    func searchBarButtonPrefering()
    func preferingSearchController()
    func refreshControlPrefering()
}



//MARK: - Main VideosMenuTableViewController Class
class VideosMenuTableViewController: UITableViewController, BasicViewControllerStatusBarBackColorSetupProtocol {

    //MARK: VideosMenuTableViewControllerPresenter
    let presenter = VideosMenuTableViewControllerPresenter()
    
    
    //MARK: @IBOutlet varibles
    @IBOutlet weak var table: UITableView!
    
    
    //MARK: Private properies
    private let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        return refreshControl
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControlPrefering()
        preferingSearchController()
        searchBarButtonPrefering()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ///Set navBar backgroundColor
        navigationController?.navigationBar.backgroundColor = .systemGroupedBackground
        setupStatusBar(for: self, backColor: .systemGroupedBackground)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        ///Remove navBar backgroundColor
        navigationController?.navigationBar.backgroundColor = .white
        setupStatusBar(for: self, backColor: .white)
    }
}



//MARK: - VideosMenuTableViewControllerProtocol extension
extension VideosMenuTableViewController: VideosMenuTableViewControllerProtocol {
    internal func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
            
            /// Setup searchBar Font
            buttonItem.titleLabel?.font = UIFont(name: BasicFonts.mediumFont, size: 14)
        }
    }
    
    
    internal func preferingSearchController() {
        searchController.searchResultsUpdater = self
        let searchTextAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.font = UIFont(name: BasicFonts.mediumFont, size: 14)
        
        /// Setup searchController
        presenter.setSearchController(navigationItem: navigationItem, searchController: searchController)
    }
    
        
    internal func refreshControlPrefering() {
        
        /// Setup refreshControl
        presenter.setRefreshControl(tableView: table, refreshControl: settingsRefreshControl)
    }
    
    
}



//MARK: - UISearchResultsUpdating extension
extension VideosMenuTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}
