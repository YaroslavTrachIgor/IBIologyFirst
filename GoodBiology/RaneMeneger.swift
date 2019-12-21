//
//  RaneMeneger.swift
//  Good Biology
//
//  Created by Yaroslav on 11/11/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import StoreKit

@available (iOS 10.3, *)

class RateManeger {
    
    class func incrementCount()
    {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count < 2
        {
            UserDefaults.standard.set(count + 1, forKey : "run_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController()
    {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {SKStoreReviewController.requestReview()})
        }
    }
}
