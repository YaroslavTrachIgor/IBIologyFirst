//
//  GoogleMapViewControllerSegmentedControl.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol GoogleMapViewControllerSegmentedControlSetupProtocol {
    func setupSegmentedContrlView()
}

class GoogleMapViewControllerSegmentedControl: UISegmentedControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSegmentedContrlView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupSegmentedContrlView()
    }
}

extension GoogleMapViewControllerSegmentedControl: GoogleMapViewControllerSegmentedControlSetupProtocol {
    
    func setupSegmentedContrlView() {
        segmentedControlBasics()
        
        // Setup Hidden only here
        setupHidden()
    }
}

extension GoogleMapViewControllerSegmentedControl {
    
    func setupHidden() {
        isHidden = false
        alpha = 1
    }
    
    func setupBasics() {
        segmentedControlBasics()
    }
}
