//
//  TestVCRatesControllerAction.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Rates Controller Action
extension TestViewController {
    
    //MARK: Private
    private func showRatesController() {
        if title == "Viruses Test" {
            RateManager.showRatesController()
        }
    }
}
