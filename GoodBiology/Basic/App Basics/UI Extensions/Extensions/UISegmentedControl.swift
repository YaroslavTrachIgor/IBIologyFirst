//
//  UISegmentedControl.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

//MARK: SegmentedControlBasics protocol
fileprivate protocol SegmentedControlBasics {
    func segConBasicView()
}



//MARK: SegmentedControlBasics extension
extension UISegmentedControl: SegmentedControlBasics {
    public func segmentedControlBasics() {
        alpha = 0
        segConBasicView()
    }
    
    public func segmentedControlForToday() {
        segConBasicView()
    }
    
    public func segConBasicView() {
        segmentedControlShadow()
        tintColor = .biologyGreenColor
        layer.cornerRadius  = 25
        layer.masksToBounds = true
        let font  = UIFont(name: "AvenirNext-DemiBold", size: 12)
        setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
    }
}
