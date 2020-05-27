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
class RateManager {
    struct Keys {
        static let runCountKey = "run_count"
    }
}



//MARK:  - Classes Functions
extension RateManager {
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: Keys.runCountKey)
        if  count < 7 {
            UserDefaults.standard.set(count + 1, forKey: Keys.runCountKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController() {
            let count = UserDefaults.standard.integer(forKey: Keys.runCountKey)
            if  count == 7 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    SKStoreReviewController.requestReview()
            })
        }
    }
}
