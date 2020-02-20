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
    private var mainTabBarController: MainTabbarController
    var navigationController: TabBarNavigationController
    
    var testsLandingRouter: TestsRouter?
    
    // MARK: - Init
    init(tabBarController: MainTabbarController) {
        // prepare UI
        mainTabBarController = tabBarController
        navigationController = TabBarNavigationController()
        showMainTabbar(animated: true)
    }
    
    func startTestsFlow(navigationController: UINavigationController,
                        animated: Bool) {
        testsLandingRouter = TestsRouter()
        testsLandingRouter?.showTestsLanding(navigationController: navigationController)
    }
}

private extension AppRouter {
    private func showMainTabbar(animated: Bool) {
        
        let articleID = StoryBoardConstants.Main.id
        let articleControllerId = StoryBoardConstants.Main.article.rawValue
        
        let forTodayID = StoryBoardConstants.ForToday.id
        let forTodayControllerId = StoryBoardConstants.ForToday.main.rawValue
        
        let biologyID = StoryBoardConstants.Biology.id
        let biologyControllerId = StoryBoardConstants.Biology.main.rawValue
        
        guard let articlesViewController = UIStoryboard.controller(by: articleID, controllerID: articleControllerId),
            let forTodayControler = UIStoryboard.controller(by: forTodayID, controllerID: forTodayControllerId),
            let biologyController = UIStoryboard.controller(by: forTodayID, controllerID: forTodayControllerId)
            else { return }

        mainTabBarController.viewControllers = [
            articlesViewController,
            forTodayControler,
            biologyController
        ]
        
        navigationController.pushViewController(mainTabBarController, animated: animated)
    }
}
