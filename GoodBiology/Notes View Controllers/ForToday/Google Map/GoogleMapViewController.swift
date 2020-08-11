//
//  GoogleMapViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 28.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

/// Google SDKs
import GooglePlaces
import GoogleMaps
import GoogleMobileAds

protocol GoogleMapViewControllerProtocol {
    func viewsBackColorSetup()
    func navItemSetup()
}

class GoogleMapViewController: UIViewController, GMSMapViewDelegate {
    
    // Main MapView
    @IBOutlet weak var mapView: BasicGoogleMapView!
    
    var geocoder: CLGeocoder!
    
    // Map Type Set UI Controls
    @IBOutlet weak var mapTypeButton:  UIBarButtonItem!
    @IBOutlet weak var panoViewShow:   UIBarButtonItem!
    
    @IBOutlet weak var segControlBack:  ContentBack! { didSet { segControlBack.isHidden = true } }
    @IBOutlet weak var segControl:      GoogleMapViewControllerSegmentedControl!
    
    @IBOutlet weak var searchButtonBack: ChromistaActionButtonsBack! { didSet { searchButtonBack.alpha = 1 } }
    @IBOutlet weak var searchButton:     UIButton!
    
    @IBOutlet weak var searchTextField:     UITextField!
    @IBOutlet weak var searchTextFieldBack: ContentBack!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewsBackColorSetup()
        navItemSetup()
        
        searchTextField.addTarget(self, action: Selector(("textFieldChanged")), for: UIControl.Event.editingChanged)
        mapView.delegate = self
    }
    
    // Test
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String,
                 name: String, location: CLLocationCoordinate2D) {
        
        /// It does not working now
        let infoMarker = GMSMarker()
        infoMarker.snippet              = placeID
        infoMarker.position             = location
        infoMarker.title                = name
        infoMarker.opacity              = 0;
        infoMarker.infoWindowAnchor.y   = 1
        infoMarker.map                  = self.mapView
        self.mapView.selectedMarker = infoMarker
    }
    
    func textFieldChanged() {
        geocoder.geocodeAddressString((searchTextField.text!)) { (placemarks, error) in
            if error != nil {
                FastAlert.showBasic(title: BasicTestWords.errorWord, message: error?.localizedDescription, vc: self)
            }
        }
    }
    
    @IBAction func changeMapType(_ sender: Any) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .hybrid
        case 1:
            mapView.mapType = .normal
        case 2:
            mapView.mapType = .satellite
        case 3:
            mapView.mapType = .terrain
        default:
            break
        }
    }
    
    @IBAction func showSegControlBck(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: segControlBack, main: view, nil)
    }
}

extension GoogleMapViewController: GoogleMapViewControllerProtocol {
    func navItemSetup() {
        navigationItem.setTitle("Places For Reading", subtitle: "Google Maps")
    }
    
    func viewsBackColorSetup() {
        navigationController?.navigationBar.backgroundColor = .groupTableViewBackground
        view.backgroundColor = .groupTableViewBackground
    }
}

extension GoogleMapViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.localizedDescription)")
    }
}
