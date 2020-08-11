//
//  BasicDidFinishLaunchingWithOptionsProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

//MARK: BasicDidFinishLaunchingWithOptionsProtocol protocol
protocol BasicDidFinishLaunchingWithOptionsProtocol {
    func setupDidFinishLaunchingMethods()
}



//MARK: BasicDidFinishLaunchingWithOptionsProtocol extension
extension AppDelegate: BasicDidFinishLaunchingWithOptionsProtocol {
    internal func setupDidFinishLaunchingMethods() {
        setupGoogleMaps()
        rateManeger()
        UIViewTintColorPrefering()
        googleSignInSetup()
        googleMobileAdsSetup()
    }
}
