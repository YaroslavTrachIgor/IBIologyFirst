//
//  ThemesMenuTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

//MARK: ThemesTableView class
final class ThemesTableView: UITableView {
    
    //MARK: ViewModel
    let viewModel = ThemesControllersViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var imageHeightConstrint: NSLayoutConstraint?
    @IBOutlet weak var imageBottomConstraint: NSLayoutConstraint?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        setImageConstraints(header)
        setConstants(header)
        setupHeader(header)
    }
}



//MARK: ThemesTableView Main Functions
extension ThemesTableView {
    fileprivate func setImageConstraints(_ header: UIView) {
        if let imageView = header.subviews.first as? UIImageView {
            imageHeightConstrint  = imageView.constraints.filter{ $0.identifier == "height" }.first
            imageBottomConstraint = imageView.constraints.filter{ $0.identifier == "bottom" }.first
        }
    }
    
    fileprivate func setConstants(_ header: UIView) {
        let offsetY = -contentOffset.y
        viewModel.setupConstant(constant: offsetY >= 0 ? 0 : offsetY / 2, for: imageBottomConstraint)
        viewModel.setupConstant(constant: max(header.bounds.height, header.bounds.height + offsetY), for: imageHeightConstrint)
    }
    
    fileprivate func setupHeader(_ header: UIView) {
        viewModel.setupHeader(header)
    }
}



//MARK: UITableViewController class
final class ThemesMenuTableViewController: UITableViewController {

    //MARK: ViewModel
    let viewModel = ThemesControllersViewModel()
    
    //MARK: IBOutlets
    // ThemesTableView
    @IBOutlet weak var table: ThemesTableView! { didSet { table.refreshControl = settingsRefreshControl } }
    
    // UIBarButtonItem
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    //MARK: Lazy Properties
    lazy var settingsRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    lazy var searchController = BasicSearchController()
    
    //MARK: Private Properties
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationControllerSetup()
    }
}



//MARK: - @IBActions
extension ThemesMenuTableViewController {
    @IBAction func share(_ sender: UIBarButtonItem) {
        viewModel.setupShare(navigationItem: navigationItem, vc: self)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "ThemesMenuTableViewController")
    }
}



//MARK: - Main Functions
extension ThemesMenuTableViewController {
    private func navigationControllerSetup() {
        viewModel.setupSearchBar(searchController.searchBar)
        viewModel.setupNavController(navigationController: navigationController!)
    }
}
