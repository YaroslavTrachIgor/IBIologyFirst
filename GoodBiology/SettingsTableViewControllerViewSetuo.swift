//
//  SettingsTableViewControllerViewSetuo.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension SettingsTableViewController {
    private func prepareinputAccessoryViewForTextView(_ sender: UITextField) {
        sender.inputAccessoryView = toolBar
    }
    
    private func prepareToolBar() {
        prepareinputAccessoryViewForTextView(ageTextField)
        prepareinputAccessoryViewForTextView(nameTextField)
        prepareinputAccessoryViewForTextView(countryTextField)
        prepareinputAccessoryViewForTextView(secondNameTextField)
        prepareinputAccessoryViewForTextView(emailTextField)
        prepareinputAccessoryViewForTextView(secondEmailTextField)
        prepareinputAccessoryViewForTextView(phoneNumberTextField)
        prepareinputAccessoryViewForTextView(birthdayTextField)
    }
    
    private func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
               buttonItem.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        }
    }
    
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func navControllerSetup() {
        navigationController?.navigationBar.backgroundColor = .groupTableViewBackground
        navigationController?.navigationBar.barTintColor    = .groupTableViewBackground
    }
}
