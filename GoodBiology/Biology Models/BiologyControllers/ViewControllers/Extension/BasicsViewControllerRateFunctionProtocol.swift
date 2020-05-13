//
//  BasicsViewControllerRateFunctionProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol BasicsViewControllerRateFunctionProtocol {
    func rate()
}

extension BasicsViewController: BasicsViewControllerRateFunctionProtocol {
    func rate() {
        if navigationItem.title == "Botany" {
            RateManager.showRatesController()
        }
    }
}
