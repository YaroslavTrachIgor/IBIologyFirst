//
//  UISegmentedControl.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

fileprivate protocol SegmentedControlBasics {
    func segConBasicView()
}

extension UISegmentedControl: SegmentedControlBasics {
    
    public func segmentedControlBasics() {
        self.alpha = 0
        
        segConBasicView()
    }
    
    public func segmentedControlForToday() {
        segConBasicView()
    }
    
    public func segConBasicView() {
        self.segmentedControlShadow()
        
        self.tintColor = lazyColor
        
        self.layer.cornerRadius  = 25
        self.layer.masksToBounds = true
        
        let font  = UIFont(name: "AvenirNext-DemiBold", size: 12)
        let color = #colorLiteral(red: 0.1880333424, green: 0.2042737603, blue: 0.2260453105, alpha: 1)
        
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
    }
}
