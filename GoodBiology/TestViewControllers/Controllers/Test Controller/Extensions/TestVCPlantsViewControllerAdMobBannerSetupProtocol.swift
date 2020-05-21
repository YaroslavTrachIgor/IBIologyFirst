//
//  TestVCPlantsViewControllerAdMobBannerSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 21.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit

//MARK: PlantsViewControllerAdMobBannerSetupProtocol
extension TestViewController: PlantsViewControllerAdMobBannerSetupProtocol {
    func showBunner() {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func setupInterstitial() {
        let request = GADRequest()
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8702634561077907/2094984293")
        interstitial.load(request)
    }
}
