//
//  SettingsTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices
import GoogleSignIn

final class SettingsTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    //Users view with Info
    @IBOutlet weak var usersInfoView: UsersInfoView!
    
    @IBOutlet weak var usersIconImageViewButton: UIButton!
    @IBOutlet weak var usersIconImageView:       UsersIconImageView!
    
    // UI Hide for hidding Users view with Info
    @IBOutlet weak var hideButton:         HideButton!
    @IBOutlet weak var hideButtonBackView: ContentBack! { didSet { hideButtonBackView.isHidden = true } }
    
    @IBOutlet weak var editButton:  UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var saveButton:  UIBarButtonItem!
    
    //Done Labels
    @IBOutlet weak var firstNameLabel:  DoneLabel!
    @IBOutlet weak var secondNameLabel: DoneLabel!
    @IBOutlet weak var emailLabel:      DoneLabel!
    
    // Special Email Label with blue color
    @IBOutlet weak var inputEmailLabel: UILabel!
    
    // Personal Information TextFields
    @IBOutlet weak var nameTextField:       SettingsTextField!
    @IBOutlet weak var secondNameTextField: SettingsTextField!
    @IBOutlet weak var emailTextField:      SettingsTextField!
    
    // Optional Personal Information TextFields
    @IBOutlet weak var ageTextField:            SettingsTextField!
    @IBOutlet weak var secondEmailTextField:    SettingsTextField!
    @IBOutlet weak var countryTextField:        SettingsTextField!
    @IBOutlet weak var birthdayTextField:       SettingsTextField! {
        didSet { birthdayTextField.keyboardType = .numberPad }
    }
    @IBOutlet weak var phoneNumberTextField:    SettingsTextField!
    
    //TableView
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var questionLabel: QuestionLabel!
    @IBOutlet weak var faqLabel:      QuestionLabel!
    @IBOutlet weak var siteLabel:     QuestionLabel!
    
    struct SettingsKeys {
        /// Personal Information Keys
        // MARK: - Labels
        static let nameLabelKey        = "lnameKey"
        static let secondNameLabelKey  = "lsecondNameKey"
        static let emailLabelKey       = "lemailKey"
        
        // MARK: - TextFields
        static let nameKey        = "nameKey"
        static let secondNameKey  = "secondNameKey"
        static let emailKey       = "emailKey"
        
        /// Personal Personal Information Keys
        static let ageKey           = "ageKey"
        static let secondEmailKey   = "secondEmailKey"
        static let countryKey       = "countryKey"
        static let birthdayKey      = "birthdayKey"
        static let phoneKey         = "phoneKey"
        
        /// User Icon Image Key
        static let imageKey = "imageKey"
    }
    
    lazy var searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    lazy var settingsRefreshControl: BasicRefreshControl = {
        let refreshControl = BasicRefreshControl()
        
        return refreshControl
    }()
    
    lazy var toolBar: BasicToolbar = {
        let toolBar     = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()

    // ubView for ActivityIndicatorView
    var acSubView: UIView?
    let acInViewIndicator = UIActivityIndicatorView()
    
    @objc dynamic var inputFirstNameText:  String?
    @objc dynamic var inputSecondNameText: String?
    @objc dynamic var inputEmailText:      String?
    
    @objc dynamic var labelFirstNameText:  String?
    @objc dynamic var labelSecondNameText: String?
    @objc dynamic var labelEmailText:      String?
    
    var firstName:  NSKeyValueObservation?
    var secondName: NSKeyValueObservation?
    var email:      NSKeyValueObservation?
    
    //MARK: - ViewModel
    let saveFunctionViewModel = SettingsTableViewControllerSaveFunctionViewModel()
    let viewModel = SettingsTableViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Oher
        loadSettings()
        prepareObservation()
        
        /// Setup Main View Things
        gesturesSetup()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.animation(view: usersInfoView, image: usersIconImageView)
    }
}

