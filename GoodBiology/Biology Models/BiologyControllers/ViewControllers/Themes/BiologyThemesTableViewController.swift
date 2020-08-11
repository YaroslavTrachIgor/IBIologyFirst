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
    
    override func viewWillDisappear(_ animated: Bool) {
        
        ///Set basic navBar tint
        navigationController?.navigationBar.backgroundColor = .systemGroupedBackground
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
        let color: UIColor = .systemBackground
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BiologyThemesTableViewControllerCell", for: indexPath) as! BiologyThemesTableViewCell
        
        /// Setup content
        cell.titleLabel?.text = " " + titleArray[indexPath.row]
        cell.contentTextView?.text = " \(titleArray[indexPath.row]) of Biology"
        
        /// Setup accessory Type
        cell.accessoryType = .disclosureIndicator
        
        /// Setup Cell TextView
        setupCellTextView(cell)
        
        /// Setup Cell notificationButton
        setupCellNotificationButton(cell)
        
        return cell
    }
    
    private func setupCellTextView(_ cell: BiologyThemesTableViewCell) {
        let textView = cell.contentTextView!
        let securityProperie: Bool = false
        
        /// Set cornerRadius
        textView.layer.cornerRadius = 12.5
        
        /// Set security level
        textView.isEditable      = securityProperie
        textView.isSelectable    = securityProperie
        textView.isScrollEnabled = securityProperie
        
        /// Set shadow
        textView.textViewShadow()
    }
    
    private func setupCellNotificationButton(_ cell: BiologyThemesTableViewCell) {
        let button = cell.notificationButton!
        
        /// Set cornerRadius
        button.layer.cornerRadius = 15
        
        /// Set border
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        button.layer.borderWidth = 1.3
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



class BiologyThemesTableViewCell: UITableViewCell {
    
    //MARK: @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    // UIButtons
    @IBOutlet weak var notificationButton: UIButton!
}

extension BiologyThemesTableViewCell {
    @IBAction func setNotification(_ sender: UIButton) {
        
        /// For Analytics
        AnalyticsManeger.addNotificationAnalytics(article: "BiologyMenuVC")
        
        /// Push Notification
        PushNotifications.setupBasicNotification(body: "Biology", inSecond: TimeInterval(BasicPushNotificationAttributes.timeInterval)) { (success) in
            if success { print(BasicPushNotificationAttributes.congratsText) } else { print(BasicPushNotificationAttributes.failText) }
        }
        
        /// UI animations
        let alertsManeger = AlertsManeger()
        alertsManeger.showNotificationView()
    }
}
