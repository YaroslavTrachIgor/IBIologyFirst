//
//  BasicAppDelegateSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleSignIn
import GoogleMaps
import GooglePlaces
import GoogleMobileAds

typealias BasicAppDelegateSetupProtocol = BasicAppGoogleProtocol & BasicAppReteManegerProtocol & BasicAppUIProtocol

protocol BasicAppGoogleProtocol {
    func googleMobileAdsSetup()
    func googleSignInSetup()
    func setupGoogleMaps()
}

protocol BasicAppReteManegerProtocol {
    func rateManeger()
}

protocol BasicAppUIProtocol {
    func UIViewTintColorPrefering()
}

extension AppDelegate: BasicAppDelegateSetupProtocol {
    func googleMobileAdsSetup() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }

    func googleSignInSetup() {
        GIDSignIn.sharedInstance()?.clientID = "773165120197-b7jgobadce59go3stoc4m5ql8anmlfdg.apps.googleusercontent.com"
    }
    
    func setupGoogleMaps() {
        let goodBiologyGMSServicesAPIKey = "AIzaSyC_nyAxK2HKM09bAGoQhoGvuI8uQz7F6-8"
        GMSServices.provideAPIKey(goodBiologyGMSServicesAPIKey)
    }
    
    func rateManeger() {
        RateManager.incrementCount()
    }
    
    func UIViewTintColorPrefering() {
        let viewModel = AppDelegateViewModel()
        viewModel.setUIWindowTintColor(window!)
        viewModel.setupNavBar()
        viewModel.setupUITabBarItem(font: UIFont(name: BasicFonts.mediumFont, size: 10)!)
        viewModel.setupTabBar()
    }
}
