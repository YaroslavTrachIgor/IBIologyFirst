//
//  ForTodayViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/25/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication
import UserNotifications
import NotificationCenter
import MessageUI
import MapKit
import CoreLocation
import AudioToolbox

class ForTodayViewController: UIViewController, NCWidgetProviding, MapBasicViewDelegate, NotesDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var mapView:                  MKMapView!
    @IBOutlet weak var mapTypeView:              UIView!
    
    @IBOutlet weak var textViewBackground:       TextViewBackView!
    @IBOutlet weak var textFieldBackground:      TextViewBackView!
    
    @IBOutlet weak var dataPickerView:           UIView!
    
    @IBOutlet weak var navItem:                  UINavigationItem!
    
    @IBOutlet weak var textViewActivity:         UIActivityIndicatorView! {
        didSet {
            textViewACHidden()
        }
    }
    @IBOutlet weak var textFieldActivitu:        UIActivityIndicatorView! {
        didSet {
            textFieldACHidden()
        }
    }
    
    @IBOutlet weak var segmentControl:           UISegmentedControl!
    
    @IBOutlet weak var mapShowingButton:         UIBarButtonItem!
    @IBOutlet weak var searchShowingButton:      UIBarButtonItem!
    @IBOutlet weak var saveButton:               UIBarButtonItem!
    @IBOutlet weak var mapViewShowingButton:     UIBarButtonItem!
    @IBOutlet weak var pickerViewShowingButton:  UIBarButtonItem!
    @IBOutlet weak var mapTypeButton:            UIBarButtonItem!
    
    @IBOutlet weak var adressLabel:              UILabel!
    
    @IBOutlet weak var voiceButton:              UIButton!
    @IBOutlet weak var reminderOutletButton:     UIButton!
    @IBOutlet weak var helpButtonOutlet:         HelpButton!
    @IBOutlet weak var choseTimeButton:          UIButton!
    
    @IBOutlet weak var mainView:                 UIView!
    
    @IBOutlet weak var inputTextView:   UITextView!
    @IBOutlet weak var inputTextField:  UITextField!
    
    struct Keys {
        static let textViewInformation  = "inputTextView"
        static let textFieldInformation = "inputTextField"
    }
    
    //MARK: Public
    static public var textViewText: String = ""
    
    var user: User?
    
    let defaults = UserDefaults.standard
    let forTodayReminderBody: String = "Are you ready to read something what you have planned ? 😏🧐"
    
    let locationMeneger        = CLLocationManager()
    let regionInMeters: Double = 1000
    
    var previousLocation:   CLLocation?
    
    //MARK: IBOutlets
    @IBOutlet weak var pickerBackgroundView:    ContentBack! {
        didSet {
            pickerBackgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        }
    }
    @IBOutlet weak var pickerView:              UIPickerView! {
        didSet {
            pickerView.layer.cornerRadius = 20
            pickerView.layer.backgroundColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        }
    }
    
    //MARK: Private
    private var geocoder: CLGeocoder!
    
    lazy var toolBar: BasicToolbar = {
        let toolBar = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        return toolBar
    }()
    
    // ubView for ActivityIndicatorView When Map is showing
    var acSubView: UIView?
    
    //MARK: LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Notes Delegate
        notesBasicViewThings()
        setupNavItemTitle()
        
        /// Map Delegate
        mapViewBasics()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [textFieldBackground, textViewBackground]
        
        UIView.animate(withDuration: 5) {
            let isEnabled = true
            
            self.pickerViewShowingButton.isEnabled  = isEnabled
            self.mapViewShowingButton.isEnabled     = isEnabled
            self.saveButton.isEnabled               = isEnabled
        }
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    objects?.alpha = 1
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                            let alpha: CGFloat = 1
                            
                            self.choseTimeButton.alpha       = alpha
                            self.reminderOutletButton.alpha  = alpha
                        }, completion: nil)
                    })
                }, completion: nil)
            }
        }
    }
    
    func mapViewBasics() {
        mapNotes()
        mapPrefering()
        adressLabelPrefering()
        chekLocationServices()
    }
    
    func notesBasicViewThings() {
        view.viewGradient()
        
        textColorPrefering()
        shadowsPrefering()
        cornersPrefering()
        basicThingsPrefering()
        notificationAlertPrefering()
        savingProccesings()
        loadingPrefering()
        chooseDateButtonPulsanting()
        systemBackgroundPrefering()
        UIBarButtonItemAlphaPrefering()
        textContainersTintSetup()
    }
    
    //MARK: Actions
    @IBAction func savingInformation(_ sender: Any) {
        textErrorsShow()

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let saveAction      = UIAlertAction(title: saveWord, style: .default) {
            (action) in
            self.saveStringData()
            
                     let alert = UIAlertController(title: savingWord, message: nil, preferredStyle: .alert)
            self.present(alert, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 0, animations: {
                    let alertAction = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
                    alert.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                    alert.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                    alert.title          = "Information saved 👍🏼"
                    alert.view.tintColor = lazyColor
                    alert.addAction(alertAction)
                })
            }
        }
        let deleteAction = UIAlertAction(title: deleteWord, style: .destructive) {
            (action) in
            self.trash()
        }
        let cancel = UIAlertAction(title: cancelWord, style: .cancel) {
                (action) in }
        
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        alertController.addAction(saveAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancel)
        alertController.view.tintColor = lazyColor
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textErrorSetup() throws {
        let hidden = true
        let alpha: CGFloat = 0
        
        guard let textFieldText = inputTextField.text, let textViewText = inputTextView.text else { return }
        
        if textViewText.isEmpty {
            throw ForTodayErrors.Errors.textViewIsntReadyForSave
            
        } else if textFieldText.isEmpty {
            throw ForTodayErrors.Errors.textFieldIsntReadyForSave
            
        } else if textViewBackground.isHidden == hidden || textViewBackground.alpha == alpha {
            throw ForTodayErrors.Errors.textFieldContentBackHidden
            
        } else if textFieldBackground.isHidden == hidden || textFieldBackground.alpha == alpha {
            throw ForTodayErrors.Errors.textFieldContentBackHidden
        }
    }
    
    //MARK: Actions
    @IBAction func mapViewShowingButton(_ sender: Any) {
        showMapView()
    }
    
    //MARK: Actions
    @IBAction func PickerViewShwingButtonAction(_ sender: Any) {
        if mapView.isHidden == true {
            if (pickerBackgroundView.isHidden == true) {
                self.pickerBackgroundView.isHidden = false
            } else {
                self.pickerBackgroundView.isHidden = true
            }
        } else {
            let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                searchController.view.tintColor = lazyColor
            
            present(searchController, animated: true, completion: nil)
        }
    }
    
    //MARK: Public
    private func shareButtonsAudio() {
        AudioServicesPlayAlertSound(1006)
    }
    
    private func audioTrash() {
        guard let textFieldText = inputTextField.text, let textViewText = inputTextView.text else { return }
        
        if textFieldText == "" && textViewText == "" {
            AudioServicesPlayAlertSound(1001)
        } else {
            AudioServicesPlayAlertSound(1022)
        }
    }
    
    private func trash() {
        guard let textFieldText = inputTextField.text, let textViewText = inputTextView.text else { return }
        
        if textViewText.isEmpty || textFieldText.isEmpty {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: cancelWord, style: .cancel) {
            (action) in }
        let delete = UIAlertAction(title: "\(deleteWord) All", style: .destructive) {
            (action) in
            
            if self.inputTextField.text!.isEmpty && self.inputTextView.text.isEmpty {
                let alertController = UIAlertController(title: sorryWord, message: "But you have nothing written.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                alertController.addAction(cancel)
                alertController.view.tintColor = lazyColor
                
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Are You Sure ?", message: "Are you sure you want to delete content and headline, that you had written", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: deleteWord, style: .destructive) {
                    (action) in
                    
                    self.inputTextField.text    = ""
                    self.inputTextView.text     = ""
                }
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                             alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                             alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                             alertController.addAction(cancel)
                             alertController.addAction(delete)
                             alertController.view.tintColor = lazyColor
                self.present(alertController, animated: true)
            }
        }
        let deleteHeadline = UIAlertAction(title: "\(deleteWord) Headline", style: .destructive) {
            (action) in
            
            if self.inputTextField.text == "" {
                let alertController = UIAlertController(title: "Sorry", message: "But you have nothing written.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                             alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                             alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                             alertController.addAction(cancel)
                             alertController.view.tintColor = lazyColor
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Are You Sure ?", message: "Are you sure you want to delete content, that you had written", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: deleteWord, style: .destructive) {
                    (action) in
                    
                    self.inputTextField.text = ""
                }
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                             alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                             alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                             alertController.addAction(cancel)
                             alertController.addAction(delete)
                             alertController.view.tintColor = lazyColor
                self.present(alertController, animated: true)
            }
        }
        let deleteContent = UIAlertAction(title: "\(deleteWord) Content", style: .destructive) {
            (action) in
            
            if self.inputTextView.text == "" {
                let alertController = UIAlertController(title: sorryWord, message: "But you have nothing written.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                alertController.addAction(cancel)
                alertController.view.tintColor = lazyColor
                
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Are You Sure ?", message: "Are you sure you want to delete content, that you had written", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: deleteWord, style: .destructive) {
                    (action) in
                    
                    self.inputTextView.text = ""
                }
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                
                alertController.addAction(cancel)
                alertController.addAction(delete)
                alertController.view.tintColor = lazyColor
                
                self.present(alertController, animated: true)
            }
        }
            alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
            alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
            
            alertController.addAction(cancel)
            alertController.addAction(delete)
            alertController.addAction(deleteHeadline)
            alertController.addAction(deleteContent)
            alertController.view.tintColor = lazyColor
        
            self.present(alertController, animated: true, completion: nil)
        } else {
            textErrorsShow()
        }
    }
    
    //MARK: Actions
    @IBAction func trash(_ sender: Any) {
        audioTrash()
        trash()
    }
    
    deinit {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    }
    
    //MARK: Actions
    @IBAction func forTodayNot(_ sender: UIButton) {
        forTodayNotShow()
        sender.pulsate()
    }
    
    //MARK: Public
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    @objc func addAnnotation(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            let location    = press.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            
            let annotationTitle    = "Good Place"
            let annotationSubtitle = "One of my favorite places for reading"
            
            let annotation            = MKPointAnnotation()
                annotation.coordinate = coordinates
            
                annotation.title    = annotationTitle
                annotation.subtitle = annotationSubtitle
            
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func datePickerShower(_ sender: UIButton) {
        if dataPickerView.isHidden == true {
            dataPickerView.isHidden = false
            pulsatingWhenDatePickNotHidden(choseTimeButton)
            
        } else {
            dataPickerView.isHidden = true
        }
        timeButtonText()
        dateViewShowingAudio()
    }
    
    @IBAction func changeTimeWithDatePicker(_ sender: UIDatePicker) {
        guard let text = inputTextView.text else { return }
        
        let dateFormatter           = DateFormatter()
            dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        
        inputTextView.text  = text + " (" + dateValue + ")"
    }
    
    @IBAction func mapTypeViewShowing(_ sender: Any) {
        if mapTypeView.isHidden == true {
            mapTypeView.isHidden        = false
            helpButtonOutlet.isHidden   = false
            adressLabel.isHidden        = true
        } else {
            adressLabel.isHidden        = false
            mapTypeView.isHidden        = true
            helpButtonOutlet.isHidden   = true
        }
    }
    
    @IBAction func mapTypeChosing(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .mutedStandard
        case 3:
            mapView.mapType = .hybrid
        default:
            print ("Error")
        }
    }
    
    @IBAction func helpButton(_ sender: Any) {
        showMailComposer()
    }
}
