//
//  ForTodayViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import AudioToolbox

class ForTodayViewControllerViewModel {
    func setMapType(_ map: MKMapView, style: MKMapType) {
        map.mapType = style
    }
    
    func setAudio(soundID: SystemSoundID) {
        AudioServicesPlayAlertSound(soundID)
    }
    
    func setupAnnotation(annotation: MKPointAnnotation, coordinates: CLLocationCoordinate2D, annotationTitle: String, annotationSubtitle: String) {
        annotation.coordinate = coordinates
        annotation.title      = annotationTitle
        annotation.subtitle   = annotationSubtitle
    }
    
    func addAnnotation(_ annotation: MKPointAnnotation, mapView: MKMapView) {
        mapView.addAnnotation(annotation)
    }
    
    func setPickerViewBackground(_ pickerViewBack: ContentBack) {
        pickerViewBack.backgroundColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        
        /// Report a bug
        pickerViewBack.layer.shadowColor = UIColor.systemGray5.cgColor
    }
    
    func setPickerView(_ pickerView: UIPickerView) {
        pickerView.layer.cornerRadius = 20
        pickerView.layer.backgroundColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
    }
    
    func setBarButtonEnabled(barButtonItem: UIBarButtonItem, enabled: Bool) {
        barButtonItem.isEnabled = enabled
    }
    
    func setViewAlpha(_ view: UIView, alpha: CGFloat) {
        view.alpha = alpha
    }
    
    func setViewHidden(_ view: UIView, hidden: Bool) {
        view.isHidden = hidden
    }
    
    func setupNavBar(_ navBar: UINavigationBar) {
        navBar.backgroundColor = .white
    }
    
    func setupTextViewBackCorners(_ view: UIView) {
        view.layer.cornerRadius = 20
    }
    
    func setTextViewsTintColor(textView: UITextView, textField: UITextField) {
        let tintColor = UIColor.biologyGreenColor
        
        textView.tintColor     = tintColor
        textField.tintColor    = tintColor
    }
    
    func setTextViewsTextColor(textView: UITextView, textField: UITextField) {
        let textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        textView.textColor     = textColor
        textField.textColor    = textColor
        
        // Set border Style
        textField.borderStyle = .none
        textField.text = "  "
    }
    
    func setToolBar(textView: UITextView, textField: UITextField, toolBar: UIToolbar) {
        textView.inputAccessoryView   = toolBar
        textField.inputAccessoryView  = toolBar
    }
    
    func setTextViewText(_ textView: UITextView, textViewText: String?) {
        guard textViewText != nil else { return }
        textView.text = textViewText
    }
    
    func copyFunction(_ textViewText: String!, _ view: UIView) {
        UIPasteboard.general.string = textViewText
        UIView.transition(with: view, duration: 1, options: .transitionFlipFromRight, animations: {
            self.setViewAlpha(view,  alpha: 1)
            self.setViewHidden(view, hidden: false)
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.setViewAlpha(view,  alpha: 0)
                self.setViewHidden(view, hidden: true)
            }
        }
    }
}
