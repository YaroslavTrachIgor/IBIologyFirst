//
//  UserActivityType.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation

enum UserActivityType: String {
    case openPlantsArticle = "yareyapp.GoodBiology.openPlantsArticle"
}

extension PlantsViewController {
    private func createUserActivityType() {
        let activity = NSUserActivity(activityType: UserActivityType.openPlantsArticle.rawValue)
        
        /// Setup activity
        activity.title = "Open Article about Plants"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
    }
    
    func openPlantsArticle() {
        createUserActivityType()
    }
}
