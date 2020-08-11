//
//  MapViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.08.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import CoreLocation
import MapKit

//MARK: - MapViewControllerViewModel
final class MapViewControllerViewModel {
    
    //MARK: Public
    public func viewDidLoadNavControllerSetup(_ navigationController: UINavigationController) {
        navigationController.navigationBar.backgroundColor = .clear
        navigationController.navigationBar.barTintColor = .white
    }
    
    public func viewWillApearNavControllerSetup(_ navigationController: UINavigationController) {
        navigationController.hidesBarsOnTap = false
        navigationController.hidesBarsOnSwipe = false
    }
    
    public func setAlpha(_ element: UIView, alpha: CGFloat) {
        element.alpha = alpha
    }
    
    public func setHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    public func setupComposer(_ composer: MFMailComposeViewController) {
        composer.setSubject("Map Problem")
        composer.setMessageBody("Here is my problem with map", isHTML: false)
    }
    
    public func typeViewBackPrefering(_ typeViewBackground: UIView) {
        typeViewBackground.layer.cornerRadius   = CGFloat(12)
        typeViewBackground.isHidden             = true
        typeViewBackground.viewShadows()
    }
    
    public func setupAlertController(_ alertController: UIAlertController, action: UIAlertAction) {
        alertController.view.tintColor = .biologyGreenColor
        alertController.addAction(action)
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
    }
    
    //MARK: MapView
    public func setupMapView(_ mapView: MKMapView) {
        mapView.mapType = .standard
        mapView.alpha   = 0
    }
    
    public func setRegion(_ mapView: MKMapView, region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
    }
    
    public func setMapType(_ mapView: MKMapView,_ mapType: MKMapType) {
        mapView.mapType = mapType
    }
    
    public func setupLocationManager(_ locManeger: CLLocationManager) {
        locManeger.desiredAccuracy = kCLLocationAccuracyBest
    }
}
