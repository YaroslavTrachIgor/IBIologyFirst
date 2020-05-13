//
//  PlantsViewControllerAdMobBannerSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleMobileAds

protocol PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner()
    func setupBanner()
}

@available(iOS 13.0, *)
extension PlantsViewController: PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner() {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func setupBanner() {
        let request = GADRequest()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8702634561077907/4154366575")
        interstitial.load(request)
    }
}
