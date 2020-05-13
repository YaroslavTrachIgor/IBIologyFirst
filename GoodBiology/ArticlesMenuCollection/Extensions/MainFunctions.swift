//
//  MainFunctions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Main Functions
extension MenuCollectionViewConteroller {
    private func setupCell(cell: MenuCollectionViewCell, textViewContent: String, labelContent: String) {
        // MARK: - Setup headerLabel
        setupCellLabel(cell: cell, text: labelContent)
        
        // MARK: - Setup cellTextView
        setupCellTextView(cell: cell, text: textViewContent)
    }
    
    private func setupCellLabel(cell: MenuCollectionViewCell, text: String) {
        /// Set text
        cell.headerLabel.text = text
        
        /// Set Shadow
        cell.headerLabel.labelShadow()
    }
    
    private func setupCellTextView(cell: MenuCollectionViewCell, text: String) {
        
        /// Set text
        cell.cellTextView.text = text
        
        /// Set cornerRadius
        cell.cellTextView.layer.cornerRadius = 14
        
        /// Set font
        cell.cellTextView.font = UIFont(name: "AvenirNext-Medium", size: 12)
        
        /// Set text Color
        cell.cellTextView.textColor = #colorLiteral(red: 0.1831960106, green: 0.198350324, blue: 0.2203657771, alpha: 1)
        
        /// Set Properties
        cell.cellTextView.isEditable = false
        cell.cellTextView.isSelectable = true
        
        /// Set Shadow
        cell.cellTextView.textViewShadow()
    }
    
    private func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor

            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    private func setupNavController() {
        setupSearchBar(searchController.searchBar)
        collectionViewMenu.refreshControl = collectionViewMenuRefreshControl
        navigationItem.searchController = searchController
    }
}

