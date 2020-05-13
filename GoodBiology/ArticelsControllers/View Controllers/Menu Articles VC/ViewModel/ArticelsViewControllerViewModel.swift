//
//  ArticelsViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class ArticelsViewControllerViewModel {
    func setupNavigationControllerBackColor(_ navigationController: UINavigationController) {
        let navBar = navigationController.navigationBar
        
        navBar.barTintColor = UIColor.systemBackground.withAlphaComponent(0.15)
    }
    
    func setupNavigationController(_ navigationController: UINavigationController) {
        navigationController.hidesBarsOnSwipe = false
        navigationController.setNavigationBarHidden(false, animated: true)
    }
    
    func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor

            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    func previewAnimation(views: [UIView], buttons: [UIView]) {
        for (index, views) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                let alpha: CGFloat = 1
                
                views.alpha = alpha
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                    for (index, buttons) in buttons.enumerated() {
                        let delay: Double = Double((index)) * 0.2
                        
                        UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
        
                            buttons.alpha = alpha
                        })
                    }
                }
            })
        }
    }
    
    //MARK: To update labels color after collectionViewController action (when we tap on 'showRootMenuArticlesButton')
    func previewLabelsAnimation(labels: [ArticlesMenuLabel], navBar: UINavigationBar) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            for (index, label) in labels.enumerated() {
                let delay: Double = Double((index)) * 0.2
                
                UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    label.textColor = .black
                    navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                })
            }
        }
    }
}

