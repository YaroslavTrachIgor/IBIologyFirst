//
//  BasicGoogleMapViewProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 29.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

protocol BasicGoogleMapViewProtocol {
    func viewSetup()
    func cameraSetup() -> GMSCameraPosition
}

class BasicGoogleMapView: GMSMapView {
    override init(frame: CGRect, camera: GMSCameraPosition) {
        super.init(frame: frame, camera: camera)
        
        cameraSet()
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        cameraSet()
        viewSetup()
    }
}

extension BasicGoogleMapView: BasicGoogleMapViewProtocol {
    
    func viewSetup() {
        cornerSetup()
        shadowsSetup()
        locationEnabled()
    }
    
    func cameraSetup() -> GMSCameraPosition {
        let camera = GMSCameraPosition.camera(withLatitude: 47.546462, longitude: 7.301262, zoom: 1.0)
        return camera
    }
}

extension BasicGoogleMapView {
    
    fileprivate func locationEnabled() {
        isMyLocationEnabled = true
    }
    
    fileprivate func shadowsSetup() {
        viewShadows()
    }
    
    fileprivate func cornerSetup() {
        layer.cornerRadius = 10
    }
}

extension BasicGoogleMapView {
    fileprivate func cameraSet() {
        self.camera = cameraSetup()
    }
}
