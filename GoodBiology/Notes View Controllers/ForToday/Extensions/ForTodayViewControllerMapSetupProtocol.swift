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

extension ForTodayViewController {
    func mapPrefering() {
        mapView.mapType = .standard
        mapView.isHidden = true
    }
    
    func showMapView() {
        var hidden: Bool
        var enabled: Bool
        
        if mapView.isHidden == false {
            hidden  = true
            enabled = false
            
            showACInView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.adressLabel.isHidden              = hidden
                self.mapView.isHidden                  = hidden
                self.mapTypeButton.isEnabled           = enabled
                self.mapTypeView.isHidden              = hidden
                self.helpButtonOutlet.isHidden         = hidden
                    
                self.mapView.mapType = .standard
            
                self.reminderOutletButton.isHidden     = !hidden
                self.textFieldBackground.isHidden      = !hidden
                self.inputTextField.isHidden           = !hidden
            
                self.pickerViewShowingButton.isEnabled = !enabled
                self.saveButton.isEnabled              = !enabled
                self.navItem.title                     = "For Today"
                self.mapViewShowingButton.isEnabled    = !enabled
                
                self.acSubView?.removeFromSuperview()
                self.acSubView = nil
                
                self.showGoogleMapViewButtonBack.isHidden = hidden
                
                self.navigationItem.setTitle("Main Notes", subtitle: "For Todat Section")
            }
        } else {
            hidden  = false
            enabled = true
            
            showACInView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.acSubView?.removeFromSuperview()
                self.acSubView = nil
                
                self.checkWiFi()
                
                self.adressLabel.isHidden              = hidden
                self.mapView.isHidden                  = hidden
                self.mapTypeButton.isEnabled           = enabled
                self.mapTypeView.isHidden              = hidden
                self.helpButtonOutlet.isHidden         = hidden
                    
                self.mapView.mapType = .standard
                    
                self.reminderOutletButton.isHidden     = !hidden
                self.textFieldBackground.isHidden      = !hidden
                self.inputTextField.isHidden           = !hidden
                
                self.pickerViewShowingButton.isEnabled = !enabled
                self.saveButton.isEnabled              = !enabled
                self.mapViewShowingButton.isEnabled    = enabled
                self.navItem.title                     = "Locations For Reading"
                
                self.helpButtonOutlet.backgroundColor = .biologyGreenColor
                
                self.showGoogleMapViewButtonBack.isHidden = hidden
                
                self.navigationItem.setTitle("Places For Reading", subtitle: "Apple Maps")
            }
        }
    }
    
    func checkWiFi() {
        let networkStatus = Reachability().connectionStatus()
        let alertController = UIAlertController(title: "Oops", message: "You are not connected to WiFi", preferredStyle: .alert)
        let action          = UIAlertAction(title: "Continue", style: .cancel) { (action) in }
        
        alertController.view.tintColor = .biologyGreenColor
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
        let enabled: Bool = false
        
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
        
        mapTypeButton.isEnabled           = enabled
        pickerViewShowingButton.isEnabled = enabled
        saveButton.isEnabled              = enabled
        mapViewShowingButton.isEnabled    = enabled
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
            let region      = MKCoordinateRegion.init(center: location, latitudinalMeters: CLLocationDistance(regionInMeters), longitudinalMeters: CLLocationDistance(regionInMeters))
            
            mapView.setRegion(region, animated: true)
        }
    }
    
    func chekLocationServices() {
        setupLocationMenegar()
        chekLocationAuthorization()
    }
    
    func chekLocationAuthorization() {
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
    }
    
    
    
    @objc func addAnnotation(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            let location    = press.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            
            let annotationTitle    = "Good Place"
            let annotationSubtitle = "One of my favorite places for reading"
            
            let annotation = MKPointAnnotation()
            
            DispatchQueue.global(qos: .utility).async {
                DispatchQueue.main.async {
                    self.viewModel.setupAnnotation(annotation: annotation, coordinates: coordinates, annotationTitle: annotationTitle, annotationSubtitle: annotationSubtitle)
                }
            }
            viewModel.addAnnotation(annotation, mapView: mapView)
        }
    }
}
