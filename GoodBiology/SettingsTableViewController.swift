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

class SettingsTableViewController: UITableViewController {
    
    // Personal Information TextFields
    @IBOutlet weak var nameTextField:       UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField:      UITextField!
    
    // Optional Personal Information TextFields
    @IBOutlet weak var ageTextField:            UITextField!
    @IBOutlet weak var secondEmailTextField:    UITextField!
    @IBOutlet weak var countryTextField:        UITextField!
    @IBOutlet weak var birthdayTextField:       UITextField!
    @IBOutlet weak var phoneNumberTextField:    UITextField!
    
    //TableView
    @IBOutlet var table: UITableView!
    
    // Personal Information Keys
    private let nameKey        = "nameKey"
    private let secondNameKey  = "secondNameKey"
    private let emailKey       = "emailKey"
    
    // System Keys
    private let switchKey   = "switchKey"
    private let sliderKey   = "sliderKey"
    
    // Optional Personal Information Keys
    private let ageKey           = "ageKey"
    private let secondEmailKey   = "secondEmailKey"
    private let countryKey       = "countryKey"
    private let birthdayKey      = "birthdayKey"
    private let phoneKey         = "phoneKey"
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return    text.isEmpty
    }
    
    private let settingsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIRefreshControl.endRefreshing), for: .valueChanged)
        
        return refreshControl
    }()
    
    lazy var toolBar: UIToolbar = {
        let toolBar     = UIToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.gray
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSettings()
        textFieldsPrefering()
        preferingSearchController()
        refreshControlPrefering()
        searchBarButtonPrefering()
        prepareToolBar()
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    private func prepareToolBar() {
        ageTextField.inputAccessoryView         = toolBar
        nameTextField.inputAccessoryView        = toolBar
        countryTextField.inputAccessoryView     = toolBar
        secondNameTextField.inputAccessoryView  = toolBar
        emailTextField.inputAccessoryView       = toolBar
        secondEmailTextField.inputAccessoryView = toolBar
        phoneNumberTextField.inputAccessoryView = toolBar
        birthdayTextField.inputAccessoryView    = toolBar
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
        searchController.searchResultsUpdater           = self
        searchController.searchBar.barStyle             = .default
        searchController.searchBar.searchBarStyle       = .minimal
        searchController.view.tintColor                 = lazyColor
        searchController.searchBar.clipsToBounds        = true
        
        let searchTextAppearance      = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            searchTextAppearance.font = UIFont(name: "AvenirNext-Medium", size: 14)
        
        navigationItem.searchController = searchController
        searchController.searchControllerBasics()
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
        
        alertController.view.tintColor = #colorLiteral(red: 0.01995553821, green: 0.3423653841, blue: 0.1189347133, alpha: 1)
        
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
        guard let url = URL(string: url) else {
            //Show an invalid URL error alert
            return
        }
        let safariVC = SFSafariViewController(url: url)
            safariVC.preferredBarTintColor      = #colorLiteral(red: 0, green: 0.2316439748, blue: 0, alpha: 1)
            safariVC.preferredControlTintColor  = .white
        
        present(safariVC, animated: true)
    }
    
    private func textFieldsPrefering() {
        nameTextField.settingsTextFieldPrefering()
        secondNameTextField.settingsTextFieldPrefering()
        emailTextField.settingsTextFieldPrefering()
        secondEmailTextField.settingsTextFieldPrefering()
        ageTextField.settingsTextFieldPrefering()
        countryTextField.settingsTextFieldPrefering()
        birthdayTextField.settingsTextFieldPrefering()
        phoneNumberTextField.settingsTextFieldPrefering()
    }
    
    private func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: nameKey) {
            nameTextField.text = name
        }
        
        if let secondName = UserDefaults.standard.string(forKey: secondNameKey) {
            secondNameTextField.text = secondName
        }
        
        if let email = UserDefaults.standard.string(forKey: emailKey) {
            emailTextField.text = email
        }
        
        if let age = UserDefaults.standard.string(forKey: ageKey) {
            ageTextField.text = age
        }
        
        if let secondEmail = UserDefaults.standard.string(forKey: secondEmailKey) {
            secondEmailTextField.text = secondEmail
        }
        
        if let country = UserDefaults.standard.string(forKey: countryKey) {
            countryTextField.text = country
        }
        
        if let birthday = UserDefaults.standard.string(forKey: birthdayKey) {
            birthdayTextField.text = birthday
        }
        
        if let phone = UserDefaults.standard.string(forKey: phoneKey) {
            phoneNumberTextField.text = phone
        }
    }
    
    @IBAction func changeName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: nameKey)
    }
    
    @IBAction func changeSecondName(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: secondNameKey)
    }
    
    @IBAction func changeEmail(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: emailKey)
    }
    
    @IBAction func changeAge(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: ageKey)
    }
    
    @IBAction func changeSecondEmail(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: secondEmailKey)
    }
    
    @IBAction func changeCountry(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: countryKey)
    }
    
    @IBAction func changeBirthday(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: birthdayKey)
    }
    
    @IBAction func changePhoneNumber(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: phoneKey)
    }
    
    @IBAction func soundsEnabeld(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: switchKey)
    }
    
    @IBAction func volume(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: sliderKey)
    }
}

extension SettingsTableViewController: MFMailComposeViewControllerDelegate {
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
            print("Fatal Error. SOS !!!")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension UITextField {
    func settingsTextFieldPrefering() {
        let size: CGFloat    = 17
        let fontName: String = "AvenirNext-Medium"
        
        self.font = UIFont(name: fontName, size: size)
    }
}

extension SettingsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}
