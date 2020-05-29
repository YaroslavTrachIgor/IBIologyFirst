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
        
        ///Set Alpha
        alpha = 0
        
        ///Setup Basics
        segConBasicView()
    }
    
    public func segmentedControlForToday() {
        
        ///Setup Basics
        segConBasicView()
    }
    
    public func segConBasicView() {
        
        ///Setup Shadow
        segmentedControlShadow()
        
        ///Set Tint
        tintColor = .biologyGreenColor
        
        ///Set Corners
        layer.cornerRadius  = 25
        layer.masksToBounds = true
        
        ///Set Font
        let font  = UIFont(name: "AvenirNext-DemiBold", size: 12)
        setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
    }
}
