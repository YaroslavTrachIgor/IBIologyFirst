//
//  ArticelsViewControllerViewSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticelsViewControllerViewSetupProtocol {
    
    // view Setup
    func articelsViewControllerTextViewSetup()
    func systemColors()
    
    // TextFields Setup
    func textViewsFontPrefering()
    
    // SearchController Setup
    func preferingSearchController()
    
    // RefreshControl Setup
    func refreshControlPrefering()
    
    //MARK: - OBSERVERS
    //MARK: ArticlesByNotificationsTextUpdate
    func createObservers()
}

protocol ArticlesByNotificationsTextUpdate {
    func plantsLabelUpdateText(notification:    NSNotification)
    func animalsLabelUpdateText(notification:   NSNotification)
    func microbesLabelUpdateText(notification:  NSNotification)
    func virusesLabelUpdateText(notification:   NSNotification)
    func humanLabelUpdateText(notification:     NSNotification)
    func archaeaLabelUpdateText(notification:   NSNotification)
    func fungusesLabelUpdateText(notification:  NSNotification)
}

typealias ArticelsViewControllerMainViewSetupProtocol = ArticlesByNotificationsTextUpdate & ArticelsViewControllerViewSetupProtocol

extension ArticelsViewController: ArticelsViewControllerMainViewSetupProtocol {
    func articelsViewControllerTextViewSetup() {
        textViewsFontPrefering()
    }
    
    func systemColors() {
        if #available(iOS 13.0, *) {
            plantTextView.setSecondaryTextColor()
            animalTextView.setSecondaryTextColor()
            microbeTextView.setSecondaryTextColor()
            humanTextView.setSecondaryTextColor()
            virusTextView.setSecondaryTextColor()
            archaeaTextView.setSecondaryTextColor()
            fungusTextView.setSecondaryTextColor()
            chromistaTextView.setSecondaryTextColor()
        }
    }
    
    func textViewsFontPrefering() {
        plantTextView.setMenuFont()
        animalTextView.setMenuFont()
        microbeTextView.setMenuFont()
        humanTextView.setMenuFont()
        virusTextView.setMenuFont()
        archaeaTextView.setMenuFont()
        fungusTextView.setMenuFont()
        chromistaTextView.setMenuFont()
    }
    
    func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func refreshControlPrefering() {
        scrollView.refreshControl = settingsRefreshControl
    }
    
    //MARK: - OBSERVERS
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.plantsLabelUpdateText(notification: )), name: NotificationNames.plantsVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.animalsLabelUpdateText(notification: )), name: NotificationNames.animalsVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.microbesLabelUpdateText(notification: )), name: NotificationNames.microbesVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.virusesLabelUpdateText(notification: )), name: NotificationNames.virusesVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.humanLabelUpdateText(notification: )), name: NotificationNames.humenVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.archaeaLabelUpdateText(notification: )), name: NotificationNames.archaeaVCKeyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArticelsViewController.fungusesLabelUpdateText(notification: )), name: NotificationNames.fungusesVCKeyName, object: nil)
    }

    //MARK: ArticlesByNotificationsTextUpdate
    @objc func plantsLabelUpdateText(notification: NSNotification) {
        plantsLabel.textColor = .biologyGreenColor
    }
    
    @objc func animalsLabelUpdateText(notification: NSNotification) {
        animalsLabel.textColor = .biologyGreenColor
    }
    
    @objc func microbesLabelUpdateText(notification: NSNotification) {
        microbesLabel.textColor = .biologyGreenColor
    }
    
    @objc func virusesLabelUpdateText(notification: NSNotification) {
        virusesLabel.textColor = .biologyGreenColor
    }
       
    @objc func humanLabelUpdateText(notification: NSNotification) {
        humanLabel.textColor = .biologyGreenColor
    }
    
    @objc func archaeaLabelUpdateText(notification: NSNotification) {
        archaeaLabel.textColor = .biologyGreenColor
    }
    
    @objc func fungusesLabelUpdateText(notification: NSNotification) {
        fungusesLabel.textColor = .biologyGreenColor
    }
}
