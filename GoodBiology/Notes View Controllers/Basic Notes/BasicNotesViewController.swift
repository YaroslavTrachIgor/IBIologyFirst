//
//  BasicNotesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/1/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox
import GoogleMobileAds
import PopMenu

final class BasicNotesViewController: UIViewController {

    let viewModel = BasicNotesViewControllerViewModel()
    
    // MARK: - @IBOutlet
    // MARK: - TextViewBackView
    @IBOutlet weak var textFieldView:                TextViewBackView!
    @IBOutlet weak var textViewBackgroundView:       TextViewBackView!
    
    // UIButtons
    @IBOutlet weak var trashButton: UIButton!
    
    // Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    // Main Fields
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    // UIBarButtonItems
    @IBOutlet weak var searchItem: UIBarButtonItem!
    
    // Picker View Background
    @IBOutlet weak var pickerViewBackground: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // UIActivityIndicatorViews
    @IBOutlet weak var textFieldActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textViewActivityIndicator: UIActivityIndicatorView!
    
    // Date Picker View
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var dateChooseButton: UIButton!
    
    // MARK: - Array
    let articlesArray = ["Plants", "Animals", "Microbes", "Fungus", "Man", "Viruses", "Archaeas", "Biology", "Internet", "Nothing"]
    
    static public var textViewText: String = ""
    
    // MARK: - BasicToolbar
    lazy var toolBar: BasicToolbar = {
        let toolBar     = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notes Delegate
        notesBasicViewThings()
        setupNavItemTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupAnimation()
    }
}


// MARK: - BasicNotesViewControllerMainProtocols
typealias BasicNotesViewControllerMainProtocols = NotesDelegate & NotesVCAnimation
extension BasicNotesViewController: BasicNotesViewControllerMainProtocols {
    func notesBasicViewThings() {
        datePickerPrefering()
        shadowsPrefering()
        dateButtonPrefering()
        alphaPrefering()
        sizingPrefering()
        textViews_Text_Prefering()
        cornersPrefering()
        activitiesPrefering()
        prepareToolBar()
        animationsPrefering()
        systemColorsPrefering()
        textContainersTintSetup()
        alphaSetup()
        setupGoogleAdBannerView()
        view.addTapGestureToHideKeyboard()
    }
    
    func setupNavItemTitle() {
        viewModel.setupNavItem(navigationItem: navigationItem)
    }
    
    func setupAnimation() {
        let objectsArray = [textFieldView, textViewBackgroundView]
        viewModel.viewDidApearAnimation(objectsArray as! [UIView])
    }
}


// MARK: - @Actions
extension BasicNotesViewController {
    @IBAction func sharing(_ sender: Any) {
        let contentText     = textView.text
        let textFieldText   = inputTextField.text
        
        guard let content = contentText, let title = textFieldText else { return }
        
        if content.isEmpty || title.isEmpty || content.isEmpty && title.isEmpty {
            viewModel.showActivityVC(content: "\(String(describing: textFieldText)) - \(String(describing: contentText))", self)
        } else {
            FastAlert.showBasic(title: "Sorry", message: "But one of the components is empty", vc: self)
        }
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "BasicNotesViewController")
    }
    
    @IBAction func search(_ sender: Any) {
        if pickerViewBackground.isHidden == true {
            pickerViewBackground.isHidden = false
        } else {
            pickerViewBackground.isHidden = true
        }
    }
    
    @IBAction func trash(_ sender: Any) {
        let manager = PopMenuManager.default
        let managerProperties = BasicPopMenuAppearanceProperties()
        let deletedText = ""
        
        /// Set Actions
        manager.actions = [PopMenuDefaultAction(title: "\(deleteWord) Headline and Content", image: UIImage(named: managerProperties.imageName), didSelect: { (_) in
            self.viewModel.setTextViewText(textView: self.textView, text: deletedText)
            self.viewModel.setTextFieldText(textField: self.inputTextField, text: deletedText)
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Headline", image: UIImage(named: managerProperties.imageName), didSelect: { (_) in
            self.viewModel.setTextFieldText(textField: self.inputTextField, text: deletedText)
            
        }), PopMenuDefaultAction(title: "\(deleteWord) Content", image: UIImage(named: managerProperties.imageName), didSelect: { (_) in
            self.textView.text = deletedText
            self.viewModel.setTextViewText(textView: self.textView, text: deletedText)
        })]
        
        /// Set menu view back color and opacity
        manager.popMenuAppearance.popMenuBackgroundStyle = .dimmed(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.7)
        
        // Set UIFont
        manager.popMenuAppearance.popMenuFont = managerProperties.basicPopMenuAppearanceFont
        
        /// Set Corners
        manager.popMenuAppearance.popMenuCornerRadius = managerProperties.basicPopMenuCornerRadius
        
        /// Set animations
        manager.popMenuAppearance.popMenuPresentationStyle = .cover()
        
        /// Set Row Heighr
        manager.popMenuAppearance.popMenuActionHeight = managerProperties.basicPopMenuActionHeight
        
        /// Presnt Maneger
        manager.present(sourceView: trashButton)
    }
    
    @objc func doneButtonAction() {
        viewModel.endEditing(view)
    }
    
    @IBAction func dateChoosing(_ sender: Any) {
        if datePickerView.isHidden == true {
            viewModel.setViewHidden(datePickerView, hidden: false)
        } else {
            viewModel.setViewHidden(datePickerView, hidden: true)
        }
        timeButtonText()
        dateViewShowingAudio()
    }
    
    @IBAction func dateOnTextView(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateValue = dateFormatter.string(from: sender.date)
        viewModel.setTextViewText(textView: textView, text: textView.text! + dateValue)
    }
}

// MARK: - GADBannerViewDelegate
extension BasicNotesViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {}
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {}
}


// MARK: - Main Functions
extension BasicNotesViewController {
    
    // MARK: Private
    private func prepareToolBar() {
        inputTextField.inputAccessoryView = toolBar
        textView.inputAccessoryView       = toolBar
    }
    
    private func dateViewShowingAudio() {
        if datePickerView.isHidden == true {
            AudioServicesPlayAlertSound(SystemSoundID(1003))
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1004))
        }
    }
    
    private func timeButtonText() {
        if datePickerView.isHidden == true {
            viewModel.setButtonTitle(dateChooseButton, title: "Choose Date")
        } else {
            viewModel.setButtonTitle(dateChooseButton, title: "Cancel")
        }
    }
    
    private func animationsPrefering() {
        UIView.animate(withDuration: 0, delay: 0.9, options: .curveLinear, animations: {
            self.viewModel.setViewAlpha(self.textView, alpha: 1)
            self.viewModel.setViewAlpha(self.inputTextField, alpha: 1)
        }) {(finished) in
            self.textFieldActivityIndicator.activityIndicatorStop()
            self.textViewActivityIndicator.activityIndicatorStop()
        }
    }
    
    private func setupGoogleAdBannerView() {
        viewModel.setupGoogleBanner(googleAdBannerView, unit: "ca-app-pub-8702634561077907/9283193921", vc: self)
    }
}
