//
//  BlankSheetViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.11.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class BlankSheetViewController: UIViewController, NotesDelegate {
    
    //IBOutlets
    @IBOutlet weak var shareButton:             UIBarButtonItem!
    @IBOutlet weak var stepperViewShowerButton: UIBarButtonItem!
    @IBOutlet weak var stepper:                 UIStepper!
    @IBOutlet weak var stepperView:             UIView!
    @IBOutlet weak var textViewBack:            UIView!
    @IBOutlet weak var textView:                UITextView!
    @IBOutlet weak var textField:               UITextField!
    
    //Keys
    private let textViewKey     = "textViewKey"
    private let textFieldKey    = "textFieldKey"
    
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

        notesBasicViewThings()
        loadSettings()
        prepareToolBar()
    }
    
    func notesBasicViewThings() {
        stepperViewSetup()
        textViewBackSetup()
        funcTextField_and_TextViewSetup()
    }
    
    private func funcTextField_and_TextViewSetup() {
        textField.text  = ""
        textView.text   = ""
        
        textField.tintColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
        textField.tintColor = #colorLiteral(red: 0, green: 0.2469184101, blue: 0.009277993813, alpha: 1)
    }
    
    private func prepareToolBar() {
        textField.inputAccessoryView = toolBar
        textView.inputAccessoryView  = toolBar
    }
    
    @IBAction func stepperViewShower(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    private func stepperViewSetup() {
        stepperView.layer.cornerRadius = 20
        stepperView.isHidden           = true
        
        stepperView.viewShadows()
    }
    
    private func textViewBackSetup() {
        let cornerRadius = 20
        
        textViewBack.layer.cornerRadius = CGFloat(cornerRadius)
        textViewBack.viewShadows()
        
        textView.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    @IBAction func textField(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text!, forKey: textFieldKey)
    }
    
    private func loadSettings() {
        if let textV = UserDefaults.standard.string(forKey: textViewKey) {
            textView.text = textV
        }
        
        if let textF = UserDefaults.standard.string(forKey: textViewKey) {
            textField.text = textF
        }
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems:
            ["""
                Headline: \(textField.text!)
                Content: \(textView.text!)
            """], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font            = textView.font?.fontName
        let fontSize        = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
}
