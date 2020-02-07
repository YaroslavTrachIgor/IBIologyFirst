//
//  SettingsTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 24.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class SettingsTableViewController: UITableViewController, UsersViewWithInfoDelegate, SettingsTableViewControllerDelegate {
    
    //Users view with Info
    @IBOutlet private weak var usersInfoView: UIView!
    
    private var hidden: Bool = false
    
    // UI Hide for hidding Users view with Info
    @IBOutlet private weak var hideButton:         UIButton!
    @IBOutlet private weak var hideButtonBackView: ContentBack!
    
    @IBOutlet private weak var editButton: UIBarButtonItem!
    
    //Done Labels
    @IBOutlet private weak var firstNameLabel:  DoneLabel!
    @IBOutlet private weak var secondNameLabel: DoneLabel!
    @IBOutlet private weak var emailLabel:      DoneLabel!
    ///Special Email Label with blue color
    @IBOutlet private weak var inputEmailLabel: UILabel!
    
    // Personal Information TextFields
    @IBOutlet private weak var nameTextField:       SettingsTextField!
    @IBOutlet private weak var secondNameTextField: SettingsTextField!
    @IBOutlet private weak var emailTextField:      SettingsTextField!
    
    // Optional Personal Information TextFields
    @IBOutlet private weak var ageTextField:            SettingsTextField!
    @IBOutlet private weak var secondEmailTextField:    SettingsTextField!
    @IBOutlet private weak var countryTextField:        SettingsTextField!
    @IBOutlet private weak var birthdayTextField:       SettingsTextField!
    @IBOutlet private weak var phoneNumberTextField:    SettingsTextField!
    
    //TableView
    @IBOutlet var table: UITableView!
    
    struct SettingsKeys {
        // Personal Information Keys
        static let nameKey        = "nameKey"
        static let secondNameKey  = "secondNameKey"
        static let emailKey       = "emailKey"
        
        // Personal Personal Information Keys
        static let ageKey           = "ageKey"
        static let secondEmailKey   = "secondEmailKey"
        static let countryKey       = "countryKey"
        static let birthdayKey      = "birthdayKey"
        static let phoneKey         = "phoneKey"
    }
    
    private let searchController = BasicSearchController()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    private let settingsRefreshControl: BasicRefreshControl = {
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
    
    @objc dynamic private var inputFirstNameText:  String?
    @objc dynamic private var inputSecondNameText: String?
    @objc dynamic private var inputEmailText:      String?
    
    fileprivate var firstName:  NSKeyValueObservation?
    fileprivate var secondName: NSKeyValueObservation?
    fileprivate var email:      NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Setup Main View Things
        setupView()
        
        /// Oher
        loadSettings()
        prepareObservation()
        
        /// Hide User Info
        setupUsersViewWithInfo_hideButtonAndView()
    }
    
    func setupView() {
        prepareToolBar()
        preferingSearchController()
        refreshControlPrefering()
        searchBarButtonPrefering()
        setupSearchBarFont()
    }
    
    func setupUsersViewWithInfo_hideButtonAndView() {
        hideButtonSetup()
        hideButtonBackViewHiddenSettup()
    }
    
    @IBAction func edit(_ sender: Any) {
        if usersInfoView.isHidden != hidden {
            usersInfoView.isHidden      = hidden
            hideButtonBackView.isHidden = !hidden
            
        } else if hideButtonBackView.isHidden == hidden {
            hideButtonBackView.isHidden = !hidden
            
        } else {
            hideButtonBackView.isHidden = hidden
        }
    }
    
    @IBAction func hideView(_ sender: Any) {
        usersInfoView.isHidden = !hidden
    }
    
    func prepareInputText() {
        nameTextField.text       = inputFirstNameText
        secondNameTextField.text = inputSecondNameText
        emailTextField.text      = inputSecondNameText
    }
    
    func prepareObservation() {
        firstName = observe(\.inputFirstNameText, options: .new, changeHandler: { (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self.nameTextField.text != "" || self.nameTextField.text != " " {
                viewController.firstNameLabel.text = "First Name: " + updateFirstName
            }
        })
        
        secondName = observe(\.inputSecondNameText, options: .new, changeHandler: { (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self.secondNameTextField.text != "" || self.secondNameTextField.text != " " {
                viewController.secondNameLabel.text = "Second Name: " + updateFirstName
            }
        })
        
        email = observe(\.inputEmailText, options: .new, changeHandler: { (viewController, change) in
            guard let updateFirstName = change.newValue as? String else { return }
            if self.emailTextField.text != "" || self.emailTextField.text != " " {
                viewController.inputEmailLabel.text =  updateFirstName
            }
        })
    }
    
    private func hideButtonSetup() {
        let appleButton = AppleButtonSettings()
        let titleColor  = lazyColor
        
        hideButton.backgroundColor = appleButton.backgroundColor
        hideButton.setTitleColor(titleColor, for: .normal)
        hideButton.layer.cornerRadius = 12
        hideButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
    }
    
    private func hideButtonBackViewHiddenSettup() {
        hideButtonBackView.isHidden = !hidden
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    private func prepareinputAccessoryViewForTextView(_ sender: UITextField) {
        sender.inputAccessoryView = toolBar
    }
    
    private func prepareToolBar() {
        prepareinputAccessoryViewForTextView(ageTextField)
        prepareinputAccessoryViewForTextView(nameTextField)
        prepareinputAccessoryViewForTextView(countryTextField)
        prepareinputAccessoryViewForTextView(secondNameTextField)
        prepareinputAccessoryViewForTextView(emailTextField)
        prepareinputAccessoryViewForTextView(secondEmailTextField)
        prepareinputAccessoryViewForTextView(phoneNumberTextField)
        prepareinputAccessoryViewForTextView(birthdayTextField)
    }
    
    private func searchBarButtonPrefering() {
        if let buttonItem = searchController.searchBar.subviews.first?.subviews.last as? UIButton {
               buttonItem.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        }
    }
    
    private func refreshControlPrefering() {
        table.refreshControl = settingsRefreshControl
    }
    
    private func preferingSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems:
            ["""
                Name: \(nameTextField.text!)
                Second Name: \(secondNameTextField.text!)
                Email: \(emailTextField.text!)
                
                Age: \(ageTextField.text!)
                Country: \(countryTextField.text!)
                Second Email: \(secondEmailTextField.text!)
                Birth Day: \(birthdayTextField.text!)
                Phone: \(phoneNumberTextField.text!)
            """], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func questions(_ sender: Any) {
        let alertController = UIAlertController(title: """
        Please take a look at the iBiology FAQ: it has important troubelshooting tips and answers to most questions
        """, message: nil, preferredStyle: .alert)
        
        let faqAction = UIAlertAction(title: "FAQ", style: .default) { (_) in
            self.showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
        }
        let questionAction = UIAlertAction(title: "Question", style: .cancel) { (_) in
            self.showMailComposer()
        }
        alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        
        alertController.view.tintColor = lazyColor
        
        alertController.addAction(faqAction)
        alertController.addAction(questionAction)

        self.present(alertController, animated: true)
    }
    
    //MARK: Public
    private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer                        = MFMailComposeViewController()
            composer.mailComposeDelegate    = self
            composer.setToRecipients(["zhbr282@gmail.com"])
            composer.setSubject("My Question")
            composer.setMessageBody("Here is my Question...", isHTML: false)
            composer.view.tintColor = lazyColor
        
        present(composer, animated: true)
    }
    
    @IBAction func faqSite(_ sender: Any) {
         showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
    }
    
    @IBAction func site(_ sender: Any) {
        showSafariVC(for: "https://zhbr282.wixsite.com/ibiology-official")
    }
    
    private func showSafariVC(for url: String) {
        guard let url = URL(string: url) else { return }
        
        let safariVC = BasicSafariVC(url: url)
        safariVC.setupSafariVC()
        
        present(safariVC, animated: true)
    }
    
    private func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: SettingsKeys.nameKey) {
            nameTextField.text = name
        }
        
        if let secondName = UserDefaults.standard.string(forKey: SettingsKeys.secondNameKey) {
            secondNameTextField.text = secondName
        }
        
        if let email = UserDefaults.standard.string(forKey: SettingsKeys.emailKey) {
            emailTextField.text = email
        }
        
        if let age = UserDefaults.standard.string(forKey: SettingsKeys.ageKey) {
            ageTextField.text = age
        }
        
        if let secondEmail = UserDefaults.standard.string(forKey: SettingsKeys.secondEmailKey) {
            secondEmailTextField.text = secondEmail
        }
        
        if let country = UserDefaults.standard.string(forKey: SettingsKeys.countryKey) {
            countryTextField.text = country
        }
        
        if let birthday = UserDefaults.standard.string(forKey: SettingsKeys.birthdayKey) {
            birthdayTextField.text = birthday
        }
        
        if let phone = UserDefaults.standard.string(forKey: SettingsKeys.phoneKey) {
            phoneNumberTextField.text = phone
        }
    }
    
    @IBAction func changeName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.nameKey)
        
        inputFirstNameText = nameTextField.text
    }
    
    @IBAction func changeSecondName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.secondNameKey)
        
        inputSecondNameText = secondNameTextField.text
    }
    
    @IBAction func changeEmail(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.emailKey)
        
        inputEmailText = emailTextField.text
    }
    
    @IBAction func changeAge(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.ageKey)
    }
    
    @IBAction func changeSecondEmail(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.secondEmailKey)
    }
    
    @IBAction func changeCountry(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.countryKey)
    }
    
    @IBAction func changeBirthday(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.birthdayKey)
    }
    
    @IBAction func changePhoneNumber(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: SettingsKeys.phoneKey)
    }
}

