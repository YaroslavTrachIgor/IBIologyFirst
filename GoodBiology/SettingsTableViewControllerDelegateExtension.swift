//
//  SettingsTableViewControllerDelegateExtension.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension SettingsTableViewController: SettingsTableViewControllerDelegate {
    func setupView() {
        prepareToolBar()
        preferingSearchController()
        refreshControlPrefering()
        searchBarButtonPrefering()
        setupSearchBarFont()
        navControllerSetup()
    }
}

extension SettingsTableViewController {
    private func prepareinputAccessoryViewForTextView(_ sender: UITextField) {
        viewModel.prepareinputAccessoryViewForTextView(textField: sender, toolBar: toolBar)
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
            viewModel.searchBarButtonPrefering(buttonItem: buttonItem)
        }
    }
    
    private func refreshControlPrefering() {
        viewModel.refreshControlPrefering(refreshControl: settingsRefreshControl, tableView: table)
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        viewModel.preferingSearchController(searchController: searchController, navItem: navigationItem)
    }
    
    func navControllerSetup() {
        viewModel.navControllerSetup(navController: navigationController!, searchController.searchBar)
    }
}
