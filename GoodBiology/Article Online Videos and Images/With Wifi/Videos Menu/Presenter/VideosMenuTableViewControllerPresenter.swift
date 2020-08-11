//
//  VideosMenuTableViewControllerPresenter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - VideosMenuTableViewControllerPresenterProtocol protocol
protocol VideosMenuTableViewControllerPresenterProtocol {
    func setSearchController(navigationItem: UINavigationItem, searchController: UISearchController)
    func setRefreshControl(tableView: UITableView, refreshControl: UIRefreshControl)
}



//MARK: - VideosMenuTableViewControllerPresenter main class
class VideosMenuTableViewControllerPresenter {}



//MARK: - VideosMenuTableViewControllerPresenterProtocol extension
extension VideosMenuTableViewControllerPresenter: VideosMenuTableViewControllerPresenterProtocol {
    internal func setSearchController(navigationItem: UINavigationItem, searchController: UISearchController) {
        navigationItem.searchController = searchController
    }
    
    internal func setRefreshControl(tableView: UITableView, refreshControl: UIRefreshControl) {
        tableView.refreshControl = refreshControl
    }
}
