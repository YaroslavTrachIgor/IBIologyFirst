//
//  AppRouter.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-11.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    static let shared = AppRouter()
    
    var testsLandingRouter: TestsRouter?
    
    func startTestsFlow(navigationController: UINavigationController,
                        animated: Bool) {
        testsLandingRouter = TestsRouter()
        testsLandingRouter?.showTestsLanding(navigationController: navigationController)
    }
}
