//
//  ArticelsViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 04.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import WhatsNewKit

class ArticelsViewControllerViewModel {
    public func setupNavigationControllerBackColor(_ navigationController: UINavigationController) {
        let navBar = navigationController.navigationBar
        
        navBar.barTintColor = UIColor.systemBackground.withAlphaComponent(0.15)
    }
    
    public func setupNavigationController(_ navigationController: UINavigationController) {
        navigationController.hidesBarsOnSwipe = false
        navigationController.setNavigationBarHidden(false, animated: true)
    }
    
    public func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor

            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    public func previewAnimation(views: [UIView], buttons: [UIView]) {
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
    public func previewLabelsAnimation(labels: [ArticlesMenuLabel], navBar: UINavigationBar) {
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
    
    //MARK: Setup WhatsNewVC
    public func setupWhatsNewVC(for vc: UIViewController) {
        
        ///Setup WhatsNewViewController.Configuration
        var configuration = WhatsNewViewController.Configuration(.default)
        configuration.setupBasicConfiguration()
        
        ///Setup items
        let items = WhatsNew(title: "What's New in iBiology",
                             items: [
                                WhatsNew.Item(title: AboutAppStringInformation.WhatsNewContent.titles[0],
                                              subtitle: AboutAppStringInformation.WhatsNewContent.subtitles[0],
                                              image: UIImage(systemName: AboutAppStringInformation.WhatsNewContent.images[0])),
                                WhatsNew.Item(title: AboutAppStringInformation.WhatsNewContent.titles[1],
                                              subtitle: AboutAppStringInformation.WhatsNewContent.subtitles[1],
                                              image: UIImage(systemName: AboutAppStringInformation.WhatsNewContent.images[1])),
                                WhatsNew.Item(title: AboutAppStringInformation.WhatsNewContent.titles[2],
                                              subtitle: AboutAppStringInformation.WhatsNewContent.subtitles[2],
                                              image: UIImage(systemName: AboutAppStringInformation.WhatsNewContent.images[2]))
        ])
        
        /// Setup whatsNewVC
        guard let whatsNewVC = WhatsNewViewController(whatsNew: items, configuration: configuration, versionStore: KeyValueWhatsNewVersionStore()) else { return }
        whatsNewVC.isModalInPresentation = true
        
        /// Present whatsNewVC
        vc.present(whatsNewVC, animated: true)
    }
}



//MARK: WhatsNewViewController.Configuration extension
extension WhatsNewViewController.Configuration {
    mutating func setupBasicConfiguration() {
        let animation: WhatsNewViewController.Animation? = .slideUp
        
        /// Setup animations
        titleView.animation        = animation
        itemsView.animation        = animation
        completionButton.animation = animation
        
        /// Setup backgroundColor
        backgroundColor = .white
        
        /// Setup fonts
        itemsView.titleFont     = UIFont(name: BasicFonts.mediumFont, size: 20)!
        itemsView.subtitleFont  = UIFont(name: BasicFonts.mediumFont, size: 12)!
        
        /// Setup completionButton
        completionButton.backgroundColor = .biologyGreenColor
        
        /// Setup titleView
        titleView.titleColor = .black
        titleView.secondaryColor = .init(
            // The start index
            startIndex: 14,
            // The length of characters
            length: 8,
            // The secondary color to apply
            color: .biologyGreenColor
        )
    }
}
