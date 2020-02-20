//
//  File.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-17.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

/// By default, when you add UITabBarController as root view controller to UINavigationController, it will hide UINavigationController's navigationBar
/// In order to show/hide it for navigation out of UITabBarController's scope, we need to implement this logic manually.
class TabBarNavigationController: UINavigationController {
    /// This method would show navigationBar if last view controller in array is other then UITabBarController type.
    /// It will hide navigationBar agian, if last view controller in array is subclass of UITabBarController type.
    private func resolveNavBarVisibility() {
        guard let controller = self.viewControllers.last else { return }
        let controllerType = type(of: controller)
        
        self.setNavigationBarHidden(controllerType.isSubclass(of: UITabBarController.self), animated: true)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let controllers = super.popToRootViewController(animated: animated)
        self.resolveNavBarVisibility()
        return controllers
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        let controllers = super.popViewController(animated: animated)
        self.resolveNavBarVisibility()
        return controllers
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.resolveNavBarVisibility()
    }
    
    override func show(_ vc: UIViewController, sender: Any?) {
        super.show(vc, sender: sender)
        self.resolveNavBarVisibility()
    }
}
