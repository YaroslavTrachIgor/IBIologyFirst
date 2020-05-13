//
//  MacawPopularViewViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 03.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import Macaw

class MacawPopularViewViewModel {
    func setTextProperties(_ text: Text, size: Font) {
        let macawPopularViewProperties = MacawPopularViewProperties()
        
        text.font = size
        text.fill = macawPopularViewProperties.color
    }
}
