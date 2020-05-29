//
//  BlankSheetViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import GoogleMobileAds
import RealmSwift
import Realm
import Signals
 
final class BlankSheetViewController: UIViewController {
    
    //MARK: - ViewModel
    let viewModel = BlankSheetViewControllerViewModel()
    
    let copyText = Signal<(String)>()
    
    //MARK: - @IBOutlets
    @IBOutlet weak var shareButton:             UIBarButtonItem!
    @IBOutlet weak var stepperViewShowerButton: UIBarButtonItem!
    @IBOutlet weak var stepper:                 UIStepper!
    @IBOutlet weak var stepperView:             UIView!
    @IBOutlet weak var textViewBack:            UIView!
    @IBOutlet weak var textView:                UITextView!
    @IBOutlet weak var textField:               UITextField!
    
    //MARK: - Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    //MARK: - Keys
    struct Keys {
        static let textViewKey  = "textViewKey"
        static let textFieldKey = "textFieldKey"
    }
    
    //MARK: - Lazy
    lazy var toolBar: BasicToolbar = {
        let toolBar     = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Notes Delegate
        notesBasicViewThings()
        setupNavItemTitle()
        
        loadSettings()
        setupGoogleAdBannerView()
    }
}


//MARK: - NotesDelegate
extension BlankSheetViewController: NotesDelegate {
    func notesBasicViewThings() {
        stepperViewSetup()
        textViewBackSetup()
        funcTextField_and_TextViewSetup()
        prepareToolBar()
        view.addTapGestureToHideKeyboard()
    }
    
    func setupNavItemTitle() {
        viewModel.navItemSetup(navigationItem)
    }
}


//MARK: - @IBActions
extension BlankSheetViewController {
    @IBAction func stepperViewShower(_ sender: Any) {
        guard let textFieldText = textView.text, let textViewText = textField.text else { return }
        
        if textFieldText.isEmpty || textViewText.isEmpty {
            showError()
        } else {
            if stepperView.isHidden == true {
                viewModel.setHidden(for: stepperView, hidden: false)
            } else {
                viewModel.setHidden(for: stepperView, hidden: true)
            }
        }
    }
    
    @IBAction func textField(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: Keys.textFieldKey)
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        viewModel.share("""
            Headline: \(textField.text!)
            Content: \(textView.text!)
        """, vc: self)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "BlankSheetViewController")
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font            = textView.font?.fontName
        let fontSize        = CGFloat(sender.value)
        
        viewModel.setTextViewFont(textView, font: UIFont(name: font!, size: fontSize)!)
    }
}
