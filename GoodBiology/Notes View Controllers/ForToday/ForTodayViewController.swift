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
import Signals
import Lottie
import FirebaseAnalytics

final class ForTodayViewController: UIViewController, NCWidgetProviding {
    
    //View Model
    let viewModel = ForTodayViewControllerViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var deleteButtonBack:          ChromistaActionButtonsBack!
    @IBOutlet weak var blankSheetGoButtonBack:    ChromistaActionButtonsBack!
    @IBOutlet weak var paintingNotesGoButtonBack: ChromistaActionButtonsBack!
    
    // Properties for Show Google Maps
    @IBOutlet weak var showGoogleMapsButton: UIButton! { didSet { showGoogleMapsButton.layer.cornerRadius = 8 } }
    @IBOutlet weak var showGoogleMapViewButtonBack: ShowGoogleMapViewButtonBack!
    
    // MapView
    @IBOutlet weak var mapView:     MKMapView!
    @IBOutlet weak var mapTypeView: ShowGoogleMapViewButtonBack!
    
    // Fiels BackViews
    @IBOutlet weak var textViewBackground:  TextViewBackView!
    @IBOutlet weak var textFieldBackground: TextViewBackView!
    
    // UIDataPicker BackViuew
    @IBOutlet weak var dataPickerView: UIView!
    
    // UINavigationItem
    @IBOutlet weak var navItem: UINavigationItem!
    
    // UIActivityIndicatorViews
    @IBOutlet weak var textViewActivity: UIActivityIndicatorView! {
        didSet { textViewACHidden() } }
    @IBOutlet weak var textFieldActivitu: UIActivityIndicatorView! {
        didSet { textFieldACHidden() } }
    
    // UISegmentedControl
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Note Copied View
    @IBOutlet weak var noteCopiedView: NoteCopiedView! 
    @IBOutlet weak var copyButton: CopyButton!
    
    // UIBarButtonItems
    @IBOutlet weak var mapShowingButton:        UIBarButtonItem!
    @IBOutlet weak var searchShowingButton:     UIBarButtonItem!
    @IBOutlet weak var saveButton:              UIBarButtonItem!
    @IBOutlet weak var mapViewShowingButton:    UIBarButtonItem!
    @IBOutlet weak var pickerViewShowingButton: UIBarButtonItem!
    @IBOutlet weak var mapTypeButton:           UIBarButtonItem!
    
    // MapView Label with adresses
    @IBOutlet weak var adressLabel: UILabel!
    
    // Diffrent Functional Buttons
    @IBOutlet weak var voiceButton:          UIButton!
    @IBOutlet weak var reminderOutletButton: UIButton!
    @IBOutlet weak var helpButtonOutlet:     HelpButton!
    @IBOutlet weak var choseTimeButton:      UIButton!
    
    // like 'view'
    @IBOutlet weak var mainView: UIView!
    
    // Main Fields
    @IBOutlet weak var inputTextView:  UITextView!
    @IBOutlet weak var inputTextField: UITextField!
    
    // UILabel
    @IBOutlet weak var lastSaveDateLabel: LastSaveDateLabel!
    
    @IBOutlet weak var pickerBackgroundView: ContentBack! { didSet { viewModel.setPickerViewBackground(pickerBackgroundView) } }
    @IBOutlet weak var pickerView: UIPickerView! { didSet { viewModel.setPickerView(pickerView) } }
    
    //MARK: - Keys
    struct Keys {
        static let textViewInformation  = "inputTextView"
        static let textFieldInformation = "inputTextField"
        static let lastSaveLabelKey     = "lastSaveLabelKey"
    }
    
    //MARK: Public
    static public var textViewText = ""
    
    // for SignIn With Apple
    var user: User?
    
    // UserDefaults
    let defaults = UserDefaults.standard
    lazy var forTodayReminderBody = {
        return "Are you ready to read something what you have planned ? 😏🧐"
    }()
    
    // Location
    let locationMeneger = CLLocationManager()
    lazy var regionInMeters = {
        return 1000
    }()
    
    // Class location properties
    var currentCoordinate: CLLocationCoordinate2D!
    var previousLocation: CLLocation?
    
    //MARK: Private
    private var geocoder: CLGeocoder!
    
    lazy var toolBar: BasicToolbar = {
        let toolBar = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        return toolBar
    }()
    
    // acView for ActivityIndicatorView When Map is showing
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
        setupAnimation()
    }
    
    deinit { removeNotifications(withIdentifiers: ["MyUniqueIdentifier"]) }
}



// MARK: - @IBActions
extension ForTodayViewController {
    @IBAction func savingInformation(_ sender: Any) {
        saveNotes()
    }
    
    @IBAction func copy(sender: UIButton) {
        Analytics.logEvent("note_copy_button_pressed", parameters: nil)
        viewModel.copyFunction(inputTextView.text!, noteCopiedView)
    }
    
    @IBAction func mapViewShowingButton(_ sender: Any) {
        showMapView()
    }
    
    @IBAction func pickerViewShwingButtonAction(_ sender: Any) {
        presentPickerViewBack()
    }
    
    @IBAction func forTodayNot(_ sender: UIButton) {
        forTodayNotShow()
        sender.pulsate()
    }
    
    @IBAction func trash(_ sender: Any) {
        trash()
    }
    
    @IBAction func datePickerShower(_ sender: UIButton) {
        if dataPickerView.isHidden == true {
            viewModel.setViewHidden(dataPickerView, hidden: false)
            
        } else {
            viewModel.setViewHidden(dataPickerView, hidden: true)
        }
        timeButtonText()
        dateViewShowingAudio()
    }
    
    @IBAction func changeTimeWithDatePicker(_ sender: UIDatePicker) {
        guard let text = inputTextView.text else { return }
        
        let dateFormatter           = DateFormatter()
            dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        
        viewModel.setTextViewText(inputTextView, textViewText: "\(text) ( \(dateValue) )")
    }
    
    @IBAction func mapTypeViewShowing(_ sender: Any) {
        let hidden: Bool
        
        if mapTypeView.isHidden == true {
            hidden = false
            
            viewModel.setViewHidden(adressLabel, hidden: !hidden)
            
            viewModel.setViewHidden(showGoogleMapViewButtonBack,    hidden: hidden)
            viewModel.setViewHidden(helpButtonOutlet,               hidden: hidden)
            viewModel.setViewHidden(mapTypeView,                    hidden: hidden)
        } else {
            hidden = true
            
            viewModel.setViewHidden(adressLabel, hidden: !hidden)
            
            viewModel.setViewHidden(showGoogleMapViewButtonBack,    hidden: hidden)
            viewModel.setViewHidden(helpButtonOutlet,               hidden: hidden)
            viewModel.setViewHidden(mapTypeView,                    hidden: hidden)
        }
    }
    
    @IBAction func mapTypeChosing(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            viewModel.setMapType(mapView, style: .standard)
        case 1:
            viewModel.setMapType(mapView, style: .satellite)
        case 2:
            viewModel.setMapType(mapView, style: .mutedStandard)
        case 3:
            viewModel.setMapType(mapView, style: .hybrid)
        default:
            print ("Error")
        }
    }
    
    @IBAction func helpButton(_ sender: Any) {
        showMailComposer()
    }
}
