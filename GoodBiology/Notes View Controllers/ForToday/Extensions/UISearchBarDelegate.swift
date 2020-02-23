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
        let queue = DispatchQueue(label: "mapQueue", attributes: .concurrent)
        let group = DispatchGroup()
        
        let activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style             = UIActivityIndicatorView.Style.medium
        }
            activityIndicator.center            = self.view.center
            activityIndicator.hidesWhenStopped  = true
            activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearch.Request()
        
        queue.async {
            DispatchQueue.main.async {
                group.enter()
                searchRequest.naturalLanguageQuery = searchBar.text
            }
            group.leave()
        }
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
        activityIndicator.stopAnimating()
            
            if response == nil {
                DispatchQueue.global(qos: .utility).async {
                    FastAlert.showBasic(title: errorWord, message: nil, vc: self)
                }
            }
            else {
                let queue = DispatchQueue(label: "mapQueue", attributes: .concurrent)
                let group = DispatchGroup()
                
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                let latitude    = response?.boundingRegion.center.latitude
                let longitude   = response?.boundingRegion.center.longitude
                
                let annotation              = MKPointAnnotation()
                
                queue.async {
                    DispatchQueue.main.async {
                        group.enter()
                        
                        annotation.title        = searchBar.text
                        annotation.coordinate   = CLLocationCoordinate2DMake(latitude!, longitude!)
                    }
                    group.leave()
                }
                
                self.mapView.addAnnotation(annotation)
                
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span    = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region  = MKCoordinateRegion(center: coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
}
