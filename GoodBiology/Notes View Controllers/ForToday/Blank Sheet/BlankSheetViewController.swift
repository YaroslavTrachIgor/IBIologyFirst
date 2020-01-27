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
    
    lazy var toolBar: BasicToolbar = {
        let toolBar     = BasicToolbar()
        let spacer      = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
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
        let tint = lazyColor
        let text = ""
        
        textField.text  = text
        textView.text   = text
        
        textField.tintColor = tint
        textField.tintColor = tint
    }
    
    private func prepareToolBar() {
        textField.inputAccessoryView = toolBar
        textView.inputAccessoryView  = toolBar
    }
    
    private func showError() {
        do {
            try setupErrors()
        } catch ForTodayErrors.Errors.textViewIsntReadyForSave {
            FastAlert.showBasic(title: errorWord, message: "Your note content is empty.", vc: self)
            
        } catch {
            FastAlert.showBasic(title: sorryWord, message: "The application has an unknown problem.", vc: self)
        }
    }
    
    private func setupErrors() throws {
        let textViewText  = textView.text!
        
        if textViewText.isEmpty {
            throw ForTodayErrors.Errors.textViewIsntReadyForSave
        }
    }
    
    @IBAction func stepperViewShower(_ sender: Any) {
        if textView.text.isEmpty || textField.text == "" {
            showError()
            
        } else {
            if stepperView.isHidden == true {
                stepperView.isHidden = false
            } else {
                stepperView.isHidden = true
            }
        }
    }
    
    private func stepperViewSetup() {
        cornerRadius = 20
        
        stepperView.layer.cornerRadius = CGFloat(cornerRadius)
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
        
        if let textF = UserDefaults.standard.string(forKey: textFieldKey) {
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
