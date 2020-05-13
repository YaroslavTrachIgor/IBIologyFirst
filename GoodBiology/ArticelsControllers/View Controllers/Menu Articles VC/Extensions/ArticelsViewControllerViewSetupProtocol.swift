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
    func textViewShadowPrefering()
    func textViewsFontPrefering()
    
    // SearchController Setup
    func preferingSearchController()
    
    // RefreshControl Setup
    func refreshControlPrefering()
}

extension ArticelsViewController: ArticelsViewControllerViewSetupProtocol {
    func articelsViewControllerTextViewSetup() {
        textViewsFontPrefering()
        textViewShadowPrefering()
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
    
    func textViewShadowPrefering() {
        plantTextView.textViewShadow()
        animalTextView.textViewShadow()
        microbeTextView.textViewShadow()
        humanTextView.textViewShadow()
        virusTextView.textViewShadow()
        archaeaTextView.textViewShadow()
        fungusTextView.textViewShadow()
        chromistaTextView.textViewShadow()
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
}
