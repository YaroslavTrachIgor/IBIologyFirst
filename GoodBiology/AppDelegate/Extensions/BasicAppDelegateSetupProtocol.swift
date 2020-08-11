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

//MARK: BasicAppGoogleProtocol protocol
protocol BasicAppGoogleProtocol {
    func googleMobileAdsSetup()
    func googleSignInSetup()
    func setupGoogleMaps()
}



//MARK: BasicAppReteManegerProtocol protocol
protocol BasicAppReteManegerProtocol {
    func rateManeger()
}



//MARK: BasicAppUIProtocol protocol
protocol BasicAppUIProtocol {
    func UIViewTintColorPrefering()
}



//MARK: BasicAppDelegateSetupProtocol typealias
typealias BasicAppDelegateSetupProtocol = BasicAppGoogleProtocol & BasicAppReteManegerProtocol & BasicAppUIProtocol



//MARK: BasicAppDelegateSetupProtocol extension
extension AppDelegate: BasicAppDelegateSetupProtocol {
    
    //MARK: googleMobileAds Setup
    func googleMobileAdsSetup() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }

    //MARK: googleSignIn Setup
    func googleSignInSetup() {
        GIDSignIn.sharedInstance()?.clientID = "773165120197-b7jgobadce59go3stoc4m5ql8anmlfdg.apps.googleusercontent.com"
    }
    
    //MARK: GoogleMaps Setup
    func setupGoogleMaps() {
        let goodBiologyGMSServicesAPIKey = "AIzaSyC_nyAxK2HKM09bAGoQhoGvuI8uQz7F6-8"
        GMSServices.provideAPIKey(goodBiologyGMSServicesAPIKey)
    }
    
    //MARK: rateManeger Setup
    func rateManeger() {
        RateManager.incrementCount()
    }
    
    //MARK: UIView Tint Color Prefering
    func UIViewTintColorPrefering() {
        let viewModel = AppDelegateViewModel()
        viewModel.setUIWindowTintColor(window!)
        viewModel.setupNavBar()
        viewModel.setupUITabBarItem(font: UIFont(name: BasicFonts.mediumFont, size: 10)!)
        viewModel.setupTabBar()
    }
}
