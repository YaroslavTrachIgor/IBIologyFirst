//
//  GADBannerViewDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 26.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import GoogleMobileAds

extension BlankSheetViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.localizedDescription)")
    }
}
