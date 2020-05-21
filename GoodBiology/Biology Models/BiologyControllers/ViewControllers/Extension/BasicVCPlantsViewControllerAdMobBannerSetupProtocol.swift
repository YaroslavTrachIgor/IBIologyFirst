//
//  BasicVCPlantsViewControllerAdMobBannerSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleMobileAds

extension BiologyViewController: PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner() {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func setupInterstitial() {
        let request = GADRequest()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8702634561077907/3602528777")
        interstitial.load(request)
    }
}
