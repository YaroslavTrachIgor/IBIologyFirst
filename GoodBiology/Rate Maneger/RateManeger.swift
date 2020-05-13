//
//  RateManeger.swift
//  GoodBiology
//
//  Created by Yaroslav on 12/6/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import StoreKit

//MARK: RateManeger
@available(iOS 10.3, *)
class RateManager {
    
    //MARK: Classes Functions
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if  count < 7 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController() {
            let count = UserDefaults.standard.integer(forKey: "run_count")
            if  count == 7 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    SKStoreReviewController.requestReview()
            })
        }
    }
}
