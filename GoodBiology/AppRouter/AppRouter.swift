//
//  AppRouter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 09.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class AppRouter: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func showDeteail(vc: UIViewController) {
        if let navigationController = navigationController {
            navigationController.popToViewController(vc, animated: true)
        }
    }
}
