//
//  UISearchBarDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 08.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

extension ForTodayViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        /// Dispatch Semaphore
        let semaphore = DispatchSemaphore(value: 0)
        
        /// Dispatch Queues
        let searchRequestQueue = DispatchQueue(label: "SearchRequestQueue")
        let annotationQueue = DispatchQueue(label: "AnnotationQueue")
        
        /// Setup activityIndicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style             = UIActivityIndicatorView.Style.medium
        activityIndicator.center            = self.view.center
        activityIndicator.hidesWhenStopped  = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequestQueue.async {
            semaphore.wait()
            searchRequest.naturalLanguageQuery = searchBar.text
            semaphore.signal()
        }
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
        activityIndicator.stopAnimating()
            
            if response == nil {
                DispatchQueue.global(qos: .utility).async {
                    FastAlert.showBasic(title: BasicTestWords.errorWord, message: nil, vc: self)
                }
            } else {
                
                /// Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                let latitude  = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                /// add Annotation
                let annotation = MKPointAnnotation()
                annotationQueue.async {
                    semaphore.wait()
                    annotation.title      = searchBar.text
                    annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                    semaphore.signal()
                }
                
                self.mapView.addAnnotation(annotation)
                
                /// Set Region
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span   = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
}
