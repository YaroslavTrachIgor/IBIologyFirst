//
//  ForTodayViewControllerMapSetupProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 11.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import Lottie

protocol ForTodayViewControllerMapSetupProtocol {
    func mapPrefering()
    func mapNotes()
    func showMapView()
    func showACInView()
    
    func adressLabelPrefering()
    func startTackingUserLocation()
    func getCenterLocation(for mapView: MKMapView) -> CLLocation
    func setupLocationMenegar()
    func centerViewOnUserLocation()
    func chekLocationServices()
    func chekLocationAuthorization()
    func checkWiFi()
}

extension ForTodayViewController: ForTodayViewControllerMapSetupProtocol {
    func mapPrefering() {
        mapView.mapType    = .standard
        mapView.isHidden   = true
    }
    
    func showMapView() {
        if mapView.isHidden == false {
            showACInView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.adressLabel.isHidden              = true
                self.mapView.isHidden                  = true
                self.mapTypeButton.isEnabled           = false
                self.mapTypeView.isHidden              = true
                self.helpButtonOutlet.isHidden         = true
                    
                self.mapView.mapType = .standard
            
                self.reminderOutletButton.isHidden     = false
                self.textFieldBackground.isHidden      = false
                self.inputTextField.isHidden           = false
            
                self.pickerViewShowingButton.isEnabled = true
                self.saveButton.isEnabled              = true
                self.navItem.title                     = "For Today"
                self.mapViewShowingButton.isEnabled    = true
                
                self.acSubView?.removeFromSuperview()
                self.acSubView = nil
            }
        } else {
            showACInView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.acSubView?.removeFromSuperview()
                self.acSubView = nil
                
                self.checkWiFi()
                
                self.adressLabel.isHidden              = false
                self.mapView.isHidden                  = false
                self.mapTypeButton.isEnabled           = true
                self.mapTypeView.isHidden              = false
                self.helpButtonOutlet.isHidden         = false
                    
                self.mapView.mapType = .standard
                    
                self.reminderOutletButton.isHidden     = true
                self.textFieldBackground.isHidden      = true
                self.inputTextField.isHidden           = true
                
                self.pickerViewShowingButton.isEnabled = false
                self.saveButton.isEnabled              = false
                self.mapViewShowingButton.isEnabled    = true
                self.navItem.title                     = "Locations For Reading"
                
                self.helpButtonOutlet.backgroundColor = lazyColor
            }
        }
    }
    
    func checkWiFi() {
        let networkStatus = Reachability().connectionStatus()
        let alertController = UIAlertController(title: "Oops", message: "You are not connected to WiFi", preferredStyle: .alert)
        let action          = UIAlertAction(title: "Continue", style: .cancel) { (action) in }
        
        alertController.view.tintColor = lazyColor
        alertController.addAction(action)
        
        switch networkStatus {
        case .Unknown, .Offline:
            print("Offline")
            self.present(alertController, animated: true, completion: nil)
        case .Online(.WWAN):
            print("Connected via WWAN")
        case .Online(.WiFi):
            print("Connected via WiFi")
        }
    }
    
    func showACInView() {
        acSubView = UIView(frame: self.view.bounds)
        acSubView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        acSubView?.layer.cornerRadius = 10
        acSubView?.viewShadows()
        
        let acInViewIndicator = UIActivityIndicatorView()
            acInViewIndicator.center = acSubView!.center
            acInViewIndicator.startAnimating()
            acInViewIndicator.activityIndicatorViewShadow()
    
        acSubView?.addSubview(acInViewIndicator)
        view.addSubview(acSubView!)
        
        if #available(iOS 13.0, *) {
            acInViewIndicator.style = .large
        }
        navigationItem.title = ""
        
        mapTypeButton.isEnabled           = false
        pickerViewShowingButton.isEnabled = false
        saveButton.isEnabled              = false
        mapViewShowingButton.isEnabled    = false
    }
    
    func mapNotes() {
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
            longPressGestureRecogn.minimumPressDuration = 0.3
        
        mapView.addGestureRecognizer(longPressGestureRecogn)
    }
    
    func adressLabelPrefering() {
        adressLabel.isHidden = true
        adressLabel.adressLabelPrefering()
        
        if #available(iOS 13.0, *) {
            adressLabel.backgroundColor = .systemBackground
        }
    }
    
    func startTackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationMeneger.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude  = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func setupLocationMenegar() {
        locationMeneger.delegate        = self
        locationMeneger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if  let location    = locationMeneger.location?.coordinate {
            let region      = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            
            mapView.setRegion(region, animated: true)
        }
    }
    
    func chekLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            DispatchQueue.global(qos: .utility).async {
                DispatchQueue.main.async {
                    self.setupLocationMenegar()
                    self.chekLocationAuthorization()
                }
            }
        }
    }
    
    func chekLocationAuthorization() {
        let group = DispatchGroup()
        DispatchQueue.global(qos: .utility).async {
            group.enter()
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                self.locationMeneger.requestWhenInUseAuthorization()
            case .restricted:
                break
            case .denied:
                break
            case .authorizedAlways:
                break
            case .authorizedWhenInUse:
                self.startTackingUserLocation()
                break
            @unknown default:
                print("Fatal Error with For Today Section")
            }
            group.leave()
        }
    }
}
