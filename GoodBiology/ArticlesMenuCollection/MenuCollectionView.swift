//
//  MenuCollectionView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Keys
struct MenuCollectionViewConterollerVCsPresentKeys {
    static let mainArticlesMenuVCpopKey = Notification.Name("popToRootArticlesMenuVCKey")
}



//MARK: - MenuCollectionViewConteroller main class
final class MenuCollectionViewConteroller: UICollectionViewController {
    
    // Content Properties
    private var articleHeader = MenuCollectionViewConterollerContent.headerContentArray
    private var articleContent = MenuCollectionViewConterollerContent.textViewContentArray
    
    // UISearchController
    private lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    // UIRefreshControl
    private lazy var collectionViewMenuRefreshControl: UIRefreshControl = {
        let refreshControl = BasicRefreshControl()
        return refreshControl
    }()
    
    private var searchedArticle = [String]()
    private var isSearching: Bool = false
    
    //MARK: - @IBOutlets
    @IBOutlet weak var collectionViewMenu: UICollectionView!
    
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setupRows()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupCell(collectionView: collectionView, indexPath: indexPath)
    }
}



// MARK: - @IBActions
extension MenuCollectionViewConteroller {
    @IBAction func presentVC(sender: UIButton) {
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                NotificationCenter.default.post(name: MenuCollectionViewConterollerVCsPresentKeys.mainArticlesMenuVCpopKey, object: nil)
            }
        }
    }
}



// MARK: - UISearchResultsUpdating
extension MenuCollectionViewConteroller: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}



// MARK: - Main Functions
extension MenuCollectionViewConteroller {
    
    /// Setup MenuCollectionView Cell
    /// - Parameters:
    ///   - cell: My Cell
    ///   - textViewContent: preview content
    ///   - labelContent: header content
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
        let textView = cell.cellTextView!
        textView.text = text
        textView.layer.cornerRadius = 14
        textView.font = UIFont(name: "AvenirNext-Medium", size: 12)
        textView.textColor = #colorLiteral(red: 0.1831960106, green: 0.198350324, blue: 0.2203657771, alpha: 1)
        textView.isEditable = false
        textView.isSelectable = true
        textView.textViewShadow()
    }
    
    //MARK: Setup setup SearchBar
    private func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor
            field.font = UIFont(name: "AvenirNext-Medium", size: 15)
            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    //MARK: Setup Navigation Controller
    private func setupNavController() {
        setupSearchBar(searchController.searchBar)
        collectionViewMenu.refreshControl = collectionViewMenuRefreshControl
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    
    private func setupRows() -> Int {
        if isSearching {
            return searchedArticle.count
        } else {
            return articleHeader.count
        }
    }
    
    /// Setup Collection View Cell
    /// - Parameters:
    ///   - collectionView: collectionView that wiil be 'cellForItemAt' use
    ///   - indexPath: thing for UICollectionViewCell
    private func setupCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        UIView.animate(withDuration: 0.4) {
            if self.isSearching {
                cell.headerLabel.text = self.searchedArticle[indexPath.row]
            } else {
                self.setupCell(cell: cell, textViewContent: self.articleContent[indexPath.row], labelContent: self.articleHeader[indexPath.row])
            }
        }
        return cell
    }
}



//MARK: - UISearchBarDelegate
extension MenuCollectionViewConteroller: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedArticle = articleHeader.filter({$0.contains(searchText)})
        isSearching = true
        
        ///Reload tableView
        DispatchQueue.main.async {
            self.collectionViewMenu.reloadData()
        }
    }
}
