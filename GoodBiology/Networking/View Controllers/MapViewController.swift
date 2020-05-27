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

//MARK: MapViewControllerViewModel
class MapViewControllerViewModel {
    
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

class MapViewController: UIViewController, MapBasicViewDelegate {

    // MapViewControllerViewModel
    let viewModel = MapViewControllerViewModel()
    
    @IBOutlet weak var mapView:              MKMapView!
    @IBOutlet weak var addressLabel:         UILabel!
    @IBOutlet weak var typeView:             UISegmentedControl!
    @IBOutlet weak var typeViewBackground:   UIView!
    
    // Problem View Show Button
    @IBOutlet weak var problumButtonViewLabel: UILabel!
    @IBOutlet weak var problemViewShowButton:  UIButton!
    @IBOutlet weak var problemViewShowButtonView: ChromistaActionButtonsBack!
    
    @IBOutlet weak var mapTypesButtonBackView: ChromistaActionButtonsBack!
    
    @IBOutlet weak var problemButton: HelpButton!
    
    private let locationManager        = CLLocationManager()
    private let regionInMeters: Double = 10000
    
    private var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Map Delegate
        mapViewBasics()
        switchingViewPrefering()

        checkWiFi()
        
        viewModel.viewDidLoadNavControllerSetup(navigationController!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let elements = [mapView, mapTypesButtonBackView, problemViewShowButtonView]
        UIView.animate(withDuration: 0.6) {
            for element in elements {
                self.viewModel.setAlpha(element!, alpha: 1)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillApearNavControllerSetup(navigationController!)
    }
}



//MARK: - @IBActions
extension MapViewController {
    /////////
    //MARK: -------- Write Presenter
    /////////
    @IBAction func questionButtonShowing(_ sender: Any) {
        if problemButton.isHidden == true {
            viewModel.setHidden(problemButton, hidden: false)
        } else {
            viewModel.setHidden(problemButton, hidden: true)
        }
    }
    
    @IBAction func contact(_ sender: Any) {
        showMailComposer()
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [addressLabel.text!], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        self.present(activityVC, animated: true, completion: nil)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "MapViewController")
    }
    
    @IBAction func mapViewStyleSwitching(_ sender: UISegmentedControl) {
        switch typeView.selectedSegmentIndex {
        case 0:
            viewModel.setMapType(mapView, .standard)
        case 1:
            viewModel.setMapType(mapView, .satellite)
        default:
            print("Error")
        }
    }
    
    @IBAction func typeViewBackShowing(_ sender: Any) {
        if typeViewBackground.isHidden == true {
            viewModel.setHidden(typeViewBackground, hidden: false)
        } else {
            viewModel.setHidden(typeViewBackground, hidden: true)
        }
    }
}



//MARK: - MapViewControllerMainFunctionsProtocol protocol
protocol MapViewControllerMainFunctionsProtocol {
    func showMailComposer()
    func mapViewPrefring()
    func checkWiFi()
    func setupLocationManager()
    func centerViewOnUserLocation()
    func checkLocationServices()
    func checkLocationAuthorization()
    func startTackingUserLocation()
    func getCenterLocation(for mapView: MKMapView) -> CLLocation
}



//MARK: - MapViewControllerMainFunctionsProtocol and other
extension MapViewController {
    
    //MARK: - MapViewControllerMainFunctionsProtocol methods
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        let composer = BasicMFMailComposeViewController(rootViewController: self)
        composer.mailComposeDelegate = self
        composer.view.tintColor = .biologyGreenColor
        viewModel.setupComposer(composer)
        present(composer, animated: true)
    }
        
    func mapViewPrefring() {
        /// Setup Basiscs of UIMapView
        
        viewModel.setupMapView(mapView)
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
    
    func checkWiFi() {
        let networkStatus = Reachability().connectionStatus()
        let alertController = UIAlertController(title: "Oops", message: "You are not connected to WiFi", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .cancel) { (action) in }
        
        viewModel.setupAlertController(alertController, action: action)
        
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
    
    func setupLocationManager() {
        locationManager.delegate = self
        viewModel.setupLocationManager(locationManager)
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
           let region   = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            viewModel.setRegion(mapView, region: region)
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
    
    
    //MARK: Private
    private func switchingViewPrefering() {
        typeViewPrefering()
        typeViewBackPrefering()
    }
    
    private func typeViewBackPrefering() {
        viewModel.typeViewBackPrefering(typeViewBackground)
    }
    
    private func typeViewPrefering() {
        typeView.segmentedControlForToday()
    }
    
    private func adressLabelPrefering() {
        addressLabel.adressLabelPrefering()
    }
}



//MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                self.checkLocationAuthorization()
            }
        }
    }
}



//MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        guard center.distance(from: previousLocation) > 50 else { return }
        
        /// Set previousLocation
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let _ = error { FastAlert.showBasic(title: nil, message: error?.localizedDescription, vc: self); return }
            guard let placemark = placemarks?.first else { return }
            
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName   = placemark.thoroughfare ?? ""
            
            /// Setup addressLabel text
            DispatchQueue.main.async {
                self.addressLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
}




//MARK: - Adress Label Setup
extension UILabel {
    func adressLabelPrefering() {
        
        /// Setup cornerRadius
        layer.cornerRadius = 1.7
        
        /// Setup borders
        layer.borderColor = #colorLiteral(red: 0.02162307128, green: 0.3310916722, blue: 0.1151730046, alpha: 1)
        layer.borderWidth = 2.5
        
        /// Setup backgroundColor
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        /// Setup text and textColor
        textColor = .biologyGreenColor
        text = ""
        
        /// Setup Shadow
        labelShadow()
    }
}



//MARK: - MFMailComposeViewControllerDelegate
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
