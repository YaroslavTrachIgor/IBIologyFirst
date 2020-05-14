//
//  BasicDidFinishLaunchingWithOptionsProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

protocol BasicDidFinishLaunchingWithOptionsProtocol {
    func setupDidFinishLaunchingMethods()
}

extension AppDelegate: BasicDidFinishLaunchingWithOptionsProtocol {
    func setupDidFinishLaunchingMethods() {
        setupGoogleMaps()
        rateManeger()
        UIViewTintColorPrefering()
        googleSignInSetup()
        googleMobileAdsSetup()
    }
}
