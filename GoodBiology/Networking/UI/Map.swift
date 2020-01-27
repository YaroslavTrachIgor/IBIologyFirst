//
//  Map.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 05.01.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit
import UIKit
import MapKit

protocol MyMapProtocol {
    func setupMap()
}

class MyMap: MKMapView {
    override func draw(_ rect: CGRect) {
        setupMap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMap()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupMap()
    }
}

extension MyMap: MyMapProtocol {
    func setupMap() {
        mapType = .standard
        alpha   = 0
    }
}
