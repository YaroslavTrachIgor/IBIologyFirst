//
//  AnalyticsManeger.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class AnalyticsManeger {
    
    static func addAnaliticsObject(name: String) {
        Analytics.logEvent(name, parameters: nil)
    }
    
    
    static func addAnaliticsObjectWithParameters(name: String, parameters: [String : Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}


//MARK: For UIButtons
extension AnalyticsManeger {
    
}

//MARK: For UISwitch
extension AnalyticsManeger {
    
}

