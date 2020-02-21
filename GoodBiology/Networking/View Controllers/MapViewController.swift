//
//  MapViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/10/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AudioToolbox
import MessageUI

class MapViewController: UIViewController, MapBasicViewDelegate {

    @IBOutlet weak var mapView:              MKMapView!
    @IBOutlet weak var addressLabel:         UILabel!
    @IBOutlet weak var typeView:             UISegmentedControl!
    @IBOutlet weak var typeViewBackground:   UIView!
    
    @IBOutlet weak var mapTypesButtonBackView: ChromistaActionButtonsBack!
    
    @IBOutlet weak var problemButton:        HelpButton!
    
    private let locationManager        = CLLocationManager()
    private let regionInMeters: Double = 10000
    
    private var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Map Delegate
        mapViewBasics()
        switchingViewPrefering()

        checkWiFi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            let alpha: CGFloat = 1
            
            self.mapView.alpha                = alpha
            self.mapTypesButtonBackView.alpha = alpha
        }
    }
    
    func mapViewBasics() {
        let semaphore = DispatchSemaphore(value: 2)
        DispatchQueue.global(qos: .utility).async {
            semaphore.wait()
            self.checkLocationServices()
        }
        semaphore.signal()
        adressLabelPrefering()
        mapViewPrefring()
    }
    
    private func checkWiFi() {
        let networkStatus = Reachability().connectionStatus()
        let alertController = UIAlertController(title: "Oops", message: "You are not connected to WiFi", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .cancel) { (action) in }
        
        alertController.view.tintColor = lazyColor
        alertController.addAction(action)
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        
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
    
    @IBAction func questionButtonShowing(_ sender: Any) {
        if problemButton.isHidden == true {
            problemButton.isHidden = false
        } else {
            problemButton.isHidden = true
        }
    }
    
    @IBAction func contact(_ sender: Any) {
        showMailComposer()
    }
    
    private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = BasicMFMailComposeViewController(rootViewController: self)
            composer.mailComposeDelegate    = self
            composer.setSubject("Map Problem")
            composer.setMessageBody("Here is my problem with map", isHTML: false)
            composer.view.tintColor = lazyColor
        
        present(composer, animated: true)
    }
        
    private func mapViewPrefring() {
        // Setup Basiscs of UIMapView
        
        mapView.mapType = .standard
        mapView.alpha   = 0
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [addressLabel.text!], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func switchingViewPrefering() {
        typeViewPrefering()
        typeViewBackPrefering()
    }
    
    private func typeViewBackPrefering() {
        typeViewBackground.layer.cornerRadius   = CGFloat(cornerRadius)
        typeViewBackground.isHidden             = true
        
        typeViewBackground.viewShadows()
    }
    
    private func typeViewPrefering() {
        typeView.segmentedControlForToday()
    }
    
    private func adressLabelPrefering() {
        addressLabel.adressLabelPrefering()
    }
    
    @IBAction func mapViewStyleSwitching(_ sender: UISegmentedControl) {
        switch  typeView.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            print("Error")
        }
    }
    
    @IBAction func typeViewBackShowing(_ sender: Any) {
        if typeViewBackground.isHidden == true {
            typeViewBackground.isHidden = false
        } else {
            typeViewBackground.isHidden = true
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate        = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
           let region   = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                if CLLocationManager.locationServicesEnabled() {
                    self.setupLocationManager()
                    self.checkLocationAuthorization()
                }
            }
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTackingUserLocation()
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("Fatal Error. SOS !!!")
        }
    }
    
    func startTackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude    = mapView.centerCoordinate.latitude
        let longitude   = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                self.checkLocationAuthorization()
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let _ = error {
                //TODO: Show alert informing the user
                return
            }
            
            guard let placemark = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            
            let streetNumber    = placemark.subThoroughfare ?? ""
            let streetName      = placemark.thoroughfare ?? ""
            
            DispatchQueue.main.async {
                self.addressLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
}

extension UILabel {
    func adressLabelPrefering() {
        self.layer.cornerRadius = 1.7
        
        self.layer.borderColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        self.layer.borderWidth = 2.5
        
        self.backgroundColor   = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.textColor         = lazyColor
        self.text              = ""
        
        self.labelShadow()
    }
}

extension MapViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("email was saved")
        case .sent:
            print("Email has been sent")
        case .failed:
            print("Failed Email sending")
        @unknown default:
            print("Fatal Error")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
