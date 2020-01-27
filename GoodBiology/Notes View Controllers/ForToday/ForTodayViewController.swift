//
//  ForTodayViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/25/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import AudioToolbox
import MapKit
import CoreLocation
import MessageUI
import LocalAuthentication
import NotificationCenter
import Speech

class ForTodayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate, NCWidgetProviding, MapBasicViewDelegate, NotesDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var mapView:                  MKMapView!
    @IBOutlet weak var mapTypeView:              UIView!
    
    @IBOutlet weak var textViewBackground:       TextViewBackView!
    @IBOutlet weak var textFieldBackground:      TextViewBackView!
    
    @IBOutlet weak var dataPickerView:           UIView!
    
    @IBOutlet weak var navItem:                  UINavigationItem!
    
    @IBOutlet weak var textViewActivity:         UIActivityIndicatorView! { didSet { textViewACHidden()  } }
    @IBOutlet weak var textFieldActivitu:        UIActivityIndicatorView! { didSet { textFieldACHidden() } }
    
    @IBOutlet weak var segmentControl:           UISegmentedControl!
    
    @IBOutlet weak var mapShowingButton:         UIBarButtonItem!
    @IBOutlet weak var searchShowingButton:      UIBarButtonItem!
    @IBOutlet weak var saveButton:               UIBarButtonItem!
    @IBOutlet weak var mapViewShowingButton:     UIBarButtonItem!
    @IBOutlet weak var trashBarButton:           UIBarButtonItem!
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
    
    //MARK: Public
    static public var textViewText: String = ""
    
    private let defaults = UserDefaults.standard
    private let forTodayReminderBody: String = "Are you ready to read something what you have planned ? 😏🧐"
    
    //MARK: Private
    private let locationMeneger            = CLLocationManager()
    private let regionInMeters:     Double = 1000
    private var previousLocation:   CLLocation?
    
    //MARK: IBOutlets
    @IBOutlet weak var pickerBackgroundView:    ContentBack!
    @IBOutlet weak var pickerView:              UIPickerView!
    
    private let array = ["Plants", "Animals", "Microbes", "Fungus", "Man", "Viruses", "Archaeas", "Biology", "Internet", "Nothing"]
    
    var user: User?
    
    private var geocoder: CLGeocoder!
    
    lazy var toolBar: BasicToolbar = {
        let toolBar = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        return toolBar
    }()
    
    private var acSubView: UIView?
    
    //MARK: LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Notes Delegate
        notesBasicViewThings()
        
        /// Map Delegate
        mapViewBasics()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [textFieldBackground, textViewBackground]
        
        UIView.animate(withDuration: 5) {
            let isEnabled = true
            
            self.trashBarButton.isEnabled           = isEnabled
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
        saveButtonFontPrefering()
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
    
    private func UIBarButtonItemAlphaPrefering() {
        let isEnabled: Bool = false
        
        mapTypeButton.isEnabled            = isEnabled
        trashBarButton.isEnabled           = isEnabled
        pickerViewShowingButton.isEnabled  = isEnabled
        mapViewShowingButton.isEnabled     = isEnabled
        saveButton.isEnabled               = isEnabled
    }
    
    private func systemBackgroundPrefering() {
        if #available(iOS 13.0, *) {
            pickerPrfering()
            UIViewsPrefering()
        }
    }
    
    private func UIViewsPrefering() {
        if #available(iOS 13.0, *) {
            view.viewSystemBack()
            
            mainView.viewSystemBack()
            mapTypeView.viewSystemBack()
            dataPickerView.viewSystemBack()
        }
    }
    
    private func pickerPrfering() {
        if #available(iOS 13.0, *) {
            pickerView.tintColor = .secondaryLabel
        }
    }
    
    private func textErrorsShow() {
        do {
            try textErrorSetup()
          
        } catch ForTodayErrors.Errors.textViewIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note title is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textViewContentBackHidden {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch ForTodayErrors.Errors.textFieldContentBackHidden {
            FastAlert.showBasic(title: errorWord, message: "Your note title is empty.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: sorryWord, message: "The application has an unknown problem.", vc: self)
        }
    }
    
    private func textErrorSetup() throws {
        let hidden = true
        let alpha: CGFloat = 0
        
        let textViewText    = inputTextView.text!
        let textFieldText   = inputTextField.text!
        
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
    
    //MARK: Struct
    struct Keys {
        static let textViewInformation  = "inputTextView"
        static let textFieldInformation = "inputTextField"
    }
    
    //MARK: Public
    func saveStringData() {
        defaults.set(inputTextView.text!,  forKey: Keys.textViewInformation )
        defaults.set(inputTextField.text!, forKey: Keys.textFieldInformation)
    }
    
    func checkForSaved() {
        let textViewShowing =  defaults.value(forKey: Keys.textViewInformation) as? String ?? ""
         inputTextView.text = textViewShowing
        
        let textFieldShowing =  defaults.value(forKey: Keys.textFieldInformation) as? String ?? ""
         inputTextField.text = textFieldShowing
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
    
    private func showACInView() {
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
        trashBarButton.isEnabled          = false
        pickerViewShowingButton.isEnabled = false
        saveButton.isEnabled              = false
        mapViewShowingButton.isEnabled    = false
    }
    
    //MARK: Actions
    @IBAction func mapViewShowingButton(_ sender: Any) {
        if mapView.isHidden == false {
            self.showACInView()
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
            
                self.trashBarButton.isEnabled          = true
                self.pickerViewShowingButton.isEnabled = true
                self.saveButton.isEnabled              = true
                self.navItem.title                     = "For Today"
                self.mapViewShowingButton.isEnabled    = true
                
                self.acSubView?.removeFromSuperview()
                self.acSubView = nil
            }
        } else {
            self.showACInView()
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
                
                self.trashBarButton.isEnabled          = false
                self.pickerViewShowingButton.isEnabled = false
                self.saveButton.isEnabled              = false
                self.mapViewShowingButton.isEnabled    = true
                self.navItem.title                     = "Locations For Reading"
                
                self.helpButtonOutlet.backgroundColor = lazyColor
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = inputTextView.text!
        
        if array[row] == "Internet" {
            inputTextField.text = "About Information From The Internet"
            if inputTextView.text == "" {
                inputTextView.text = text + " About Information From The Internet"
            } else {
                inputTextView.text = text + "," + " About Information From The Internet"
            }
        } else {
            inputTextField.text = "About \(array[row])"
            if inputTextView.text == "" {
                inputTextView.text = text + " About \(array[row])"
            } else {
                inputTextView.text = text + "," + " About \(array[row])"
            }
        }
        if array[row] == "Nothing" {
            inputTextField.text = "Nothing"
            if inputTextView.text == "" {
                inputTextView.text = text + "Today I don't want to read anything"
            } else {
                inputTextView.text = text + "," + "Today I don't want to read anything"
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor     = .darkGray
        label.font          = UIFont(name: "AvenirNext-Medium", size: 21)
        label.textAlignment = .center
        label.text          = array[row]
        
        return label
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let activityIndicator = UIActivityIndicatorView()
            activityIndicator.style             = UIActivityIndicatorView.Style.medium
            activityIndicator.center            = self.view.center
            activityIndicator.hidesWhenStopped  = true
            activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            activityIndicator.stopAnimating()
            
            if response == nil { print("Error") }
            else {
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                let latitude    = response?.boundingRegion.center.latitude
                let longitude   = response?.boundingRegion.center.longitude
                
                let annotation              = MKPointAnnotation()
                    annotation.title        = searchBar.text
                    annotation.coordinate   = CLLocationCoordinate2DMake(latitude!, longitude!)
                
                self.mapView.addAnnotation(annotation)
                
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span    = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region  = MKCoordinateRegion(center: coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
    
    //MARK: Public
    private func shareButtonsAudio() {
        AudioServicesPlayAlertSound(1006)
    }
    
    private func audioTrash() {
        if inputTextField.text == "" && inputTextView.text == "" {
            AudioServicesPlayAlertSound(1001)
        } else {
            AudioServicesPlayAlertSound(1022)
        }
    }
    
    private func trash() {
        if inputTextView.text != "" || inputTextField.text != "" || inputTextView.text != "" && inputTextField.text != "" {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: cancelWord, style: .cancel) {
            (action) in }
        let delete = UIAlertAction(title: "\(deleteWord) All", style: .destructive) {
            (action) in
            
            if self.inputTextField.text == "" && self.inputTextView.text == "" || self.inputTextField.text == " " && self.inputTextView.text == " " {
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
            
            if self.inputTextField.text == "" || self.inputTextField.text == " " {
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
            
            if self.inputTextView.text == "" || self.inputTextView.text == " " {
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
    
    //MARK: Public
    func removeNotifications(withIdentifiers identifiers: [String])   {
        let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //MARK: Actions
    @IBAction func forTodayNot(_ sender: UIButton) {
        if inputTextField.text == "Nothing" {
            nothingNotificationSchedule(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText)
                } else {
                    print(failText)
                }
            }
        } else {
            forTodayReminderSchedule(inSecond: TimeInterval(timeInterval)) { (success) in
                if success {
                    print(congratsText)
                } else {
                    print(failText)
                }
            }
        }
        reminderOutletButton.settingTittleForNotificationButton()
        notificationAudio()
        
        sender.pulsate()
    }
    
    private func notificationAudio() {
        AudioServicesPlayAlertSound(SystemSoundID(1002))
    }
    
    func nothingNotificationSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        let body: String = "Today, you sad - that you don't want anything to read"
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content             = UNMutableNotificationContent()
            content.title           = "Hey !"
            content.body            = body
            content.sound           = UNNotificationSound.default
            content.categoryIdentifier = userAction
        
        let calendar            = Calendar(identifier: .gregorian)
        let components          = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger             = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request             = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        let center              = UNUserNotificationCenter.current()
        let deleteAction        = UNNotificationAction(identifier: deleteWord, title: deleteWord, options: [.destructive])
        let category            = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        center.add(request, withCompletionHandler: nil)
    }
    
    public func forTodayReminderSchedule(inSecond seconds: TimeInterval, completion: (Bool) -> ()) {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
            print(Date())
            print(date)
        
        let header = "Let's Go"
        
        let content                         = UNMutableNotificationContent()
            content.title                   = header
            content.body                    = forTodayReminderBody
            content.sound                   = UNNotificationSound.default
            content.categoryIdentifier      = userAction
        
        let calendar        = Calendar(identifier: .gregorian)
        let components      = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger         = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request         = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        let center          = UNUserNotificationCenter.current()
        let deleteAction    = UNNotificationAction(identifier: deleteWord, title: deleteWord, options: [.destructive])
        let category        = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
            center.setNotificationCategories([category])
            center.add(request, withCompletionHandler: nil)
    }
    
    //MARK: Public
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    private func prepareToolBar() {
        inputTextField.inputAccessoryView = toolBar
        inputTextView.inputAccessoryView  = toolBar
    }
    
    private func textViewACHidden() {
        if inputTextView.text == "" { textViewActivity.isHidden = true }
    }
    
    private func textFieldACHidden() {
        if inputTextField.text == "" { textFieldActivitu.isHidden = true }
    }
    
    private func textColorPrefering() {
        let textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        self.inputTextView.textColor  = textColor
        self.inputTextField.textColor = textColor
    }
    
    private func mapNotes() {
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
            longPressGestureRecogn.minimumPressDuration = 0.3
        
        mapView.addGestureRecognizer(longPressGestureRecogn)
    }
    
    private func saveButtonFontPrefering() {
        let saveButtonColor = lazyColor
        
        self.saveButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "AvenirNext-Medium", size: 18.68)!,
            NSAttributedString.Key.foregroundColor : saveButtonColor,
            ], for: .normal)
    }
    
    private func shadowsPrefering() {
        helpButtonOutlet.buttonsShadows()
        pickerView.pickerViewShadow()
        choseTimeButton.buttonsShadows()
        dataPickerView.viewShadows()
        mapTypeView.viewShadows()
    }
    
    private func mapPrefering() {
        mapView.mapType    = .standard
        mapView.isHidden   = true
    }
    
    private func cornersPrefering() {
        textViewBackground.layer.cornerRadius  = 20
    }
    
    private func basicThingsPrefering() {
        textViewACHidden()
        textFieldACHidden()
        
        prepareToolBar()
        
        reminderOutletButton.notificationButtonBasics()
        segmentControl.segmentedControlForToday()
        choseTimeButton.notificationButtonBasics()
    }
    
    private func adressLabelPrefering() {
        adressLabel.isHidden = true
        adressLabel.adressLabelPrefering()
        
        if #available(iOS 13.0, *) {
            adressLabel.backgroundColor = .systemBackground
        }
    }
    
    private func loadingPrefering() {
        self.textViewActivity.activityIndicatorStarts(colorOfActivity: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        UIView.animate(withDuration: 0.6, delay: 0.5, options: .curveLinear, animations: {
            self.inputTextView.alpha = 1
        }) {(finished) in
            self.textViewActivity.activityIndicatorStop()
            self.textViewActivity.isHidden = true
        }
        
        inputTextField.alpha = 0
        textFieldActivitu.activityIndicatorStarts(colorOfActivity: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        UIView.animate(withDuration: 0.6, delay: 0.5, options: .curveLinear, animations: {
            self.inputTextField.alpha = 1
        }) {(finished) in
            self.textFieldActivitu.activityIndicatorStop()
            self.textFieldActivitu.isHidden = true
        }
    }
    
    private func notificationAlertPrefering() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    private func savingProccesings() {
        chekLocationAuthorization()
        checkForSaved()
    }
    
    private func chooseDateButtonPulsanting() {
        if dataPickerView.isHidden == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                for _ in 0...10000000000 {
                    self.choseTimeButton.pulsate()
                }
            }
        }
    }
    
    @objc func addAnnotation(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            let location    = press.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            
            let annotation            = MKPointAnnotation()
                annotation.coordinate = coordinates
                annotation.title      = "My Place"
                annotation.subtitle   = "One of my favorite places"
            
            mapView.addAnnotation(annotation)
        }
    }
    
    private func setupLocationMenegar() {
        locationMeneger.delegate        = self
        locationMeneger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func centerViewOnUserLocation() {
        if  let location    = locationMeneger.location?.coordinate {
            let region      = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func chekLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationMenegar()
            chekLocationAuthorization()
        } else {}
    }
    
    private func chekLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationMeneger.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            startTackingUserLocation()
            break
        @unknown default:
            print("Fatal Error with For Today Section")
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
    
    private func pulsatingWhenDatePickNotHidden(_ sender: UIButton) {
        sender.pulsate(duration: 1)
    }
    
    private func dateViewShowingAudio() {
        if dataPickerView.isHidden == true {
            AudioServicesPlayAlertSound(SystemSoundID(1003))
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1004))
        }
    }
    
    private func timeButtonText() {
        if dataPickerView.isHidden == true {
            choseTimeButton.setTitle("Choose Date", for: .normal)
        } else {
            choseTimeButton.setTitle("Cancel", for: .normal)
        }
    }
    
    @IBAction func changeTime(_ sender: UIDatePicker) {
        let dateFormatter           = DateFormatter()
            dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        
        inputTextView.text  = "\(inputTextView.text! + dateValue)"
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
    
    private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("Map Problem")
            composer.setMessageBody("Here is my problem with map", isHTML: false)
        
        present(composer, animated: true)
    }
    
    private func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude  = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func startTackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationMeneger.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    private func textContainersTintSetup() {
        let tintColor = lazyColor
        
        inputTextView.tintColor     = tintColor
        inputTextField.tintColor    = tintColor
    }
}

//MARK: Extension
extension ForTodayViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        chekLocationAuthorization()
    }
}

extension ForTodayViewController: MKMapViewDelegate {
    
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
            let defaultString = ""
            
            let streetNumber = placemark.subThoroughfare ?? defaultString
            let streetName   = placemark.thoroughfare ?? defaultString
            
            DispatchQueue.main.async {
                self.adressLabel.text = "\(streetNumber) \(streetName)"
            }
        }
    }
}

extension ForTodayViewController: MFMailComposeViewControllerDelegate {
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
