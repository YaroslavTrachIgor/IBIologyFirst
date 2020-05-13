//
//  File.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension ForTodayViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        chekLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
        mapView.userTrackingMode = .followWithHeading
    }
}
