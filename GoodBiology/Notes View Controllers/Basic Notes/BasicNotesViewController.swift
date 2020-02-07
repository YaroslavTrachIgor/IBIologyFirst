//
//  BasicNotesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/1/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class BasicNotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, NotesDelegate {

    @IBOutlet weak var textFieldView:                TextViewBackView!
    @IBOutlet weak var textViewBackgroundView:       TextViewBackView!
    
    @IBOutlet weak var inputTextField:               UITextField!
    @IBOutlet weak var textView:                     UITextView!
    @IBOutlet weak var trashItem:                    UIBarButtonItem!
    @IBOutlet weak var searchItem:                   UIBarButtonItem!
    @IBOutlet weak var pickerViewBackground:         UIView!
    @IBOutlet weak var pickerView:                   UIPickerView!
    @IBOutlet weak var textFieldActivityIndicator:   UIActivityIndicatorView!
    @IBOutlet weak var textViewActivityIndicator:    UIActivityIndicatorView!
    @IBOutlet weak var datePicker:                   UIPickerView!
    @IBOutlet weak var datePickerView:               UIView!
    @IBOutlet weak var dateChooseButton:             UIButton!
    
    private let array = ["Plants", "Animals", "Microbes", "Fungus", "Man", "Viruses", "Archaeas", "Biology", "Internet", "Nothing"]
    
    static public var textViewText: String = ""
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let objectsArray = [textFieldView, textViewBackgroundView]
        
        for (index, objects) in objectsArray.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.23, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                objects?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
    }
    
    // NotesDelegate Method
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
        navigationItemSetup()
    }
    
    private func systemColorsPrefering() {
        datePickerView.viewSystemBack()
        pickerView.viewSystemBack()
        pickerViewBackground.viewSystemBack()
    }
    
    private func alphaSetup() {
        let alpha = 1
        
        textViewBackgroundView.alpha = CGFloat(alpha)
        textFieldView.alpha          = CGFloat(alpha)
    }
    
    private func textContainersTintSetup() {
        let tintColor = lazyColor
        
        textView.tintColor       = tintColor
        inputTextField.tintColor = tintColor
    }
    
    @IBAction func sharing(_ sender: Any) {
        let contentText     = textView.text
        let textFieldText   = inputTextField.text
        
        if textView.text != "" || inputTextField.text != "" || textView.text != "" && inputTextField.text != "" {
            let activityVC = UIActivityViewController(activityItems: ["\(textFieldText!) - \(contentText!)"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view

            UIApplication.shared.keyWindow?.tintColor = lazyColor
            
            self.present(activityVC, animated: true, completion: nil)
            
            print("""
                 User want to share with his/her notes in "Basic Notes" section
                 """)
        } else {
            let alert = UIAlertController(title: "Sorry", message: "But one of the components is empty", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alert.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                    alert.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                    alert.view.tintColor = lazyColor
                    alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
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
        let text = textView.text!
        
        if array[row] == "Internet" {
            inputTextField.text = "About Information From The Internet"
            if textView.text == "" {
                textView.text = text + " About Information From The Internet"
            } else {
                textView.text = text + "," + " About Information From The Internet"
            }
        } else {
            inputTextField.text = "About \(array[row])"
            if textView.text == "" {
                textView.text = text + " About \(array[row])"
            } else {
                textView.text = text + "," + " About \(array[row])"
            }
        }
        
        if array[row] == "Nothing" {
            inputTextField.text = "Nothing"
            if textView.text == "" {
                textView.text = text + "Today I don't want to read anything"
            } else {
                textView.text = text + "," + "Today I don't want to read anything"
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
                label.textColor = .darkGray
                label.font = UIFont(name: "AvenirNext-Medium", size: 21)
                label.textAlignment = .center
                label.text = array[row]
        return  label
    }
    
    @IBAction func search(_ sender: Any) {
        if pickerViewBackground.isHidden == true {
            pickerViewBackground.isHidden = false
        } else {
            pickerViewBackground.isHidden = true
        }
    }
    
    @IBAction func trash(_ sender: Any) {
        if textView.text != "" || inputTextField.text != "" || textView.text != "" && inputTextField.text != "" {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: cancelWord, style: .cancel) {
                (action) in }
            let delete = UIAlertAction(title: "\(deleteWord) All", style: .destructive) {
            (action) in
            
            if self.inputTextField.text == "" && self.textView.text == "" || self.inputTextField.text == " " && self.textView.text == " " {
                let alertController = UIAlertController(title: sorryWord, message: "But you have nothing written.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                alertController.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                alertController.addAction(cancel)
                alertController.view.tintColor = lazyColor
                
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Are You Sure ?", message: "Are you sure you want to delete note content and title, that you had written", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: deleteWord, style: .destructive) {
                    (action) in
                    
                    self.inputTextField.text    = ""
                    self.textView.text          = ""
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
                    let alertController = UIAlertController(title: sorryWord, message: "But you have nothing written.", preferredStyle: .alert)
                
                    let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
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
            
            if self.textView.text == "" || self.textView.text == " " {
                let alertController = UIAlertController(title: sorryWord, message: "But you have nothing written.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: cancelWord, style: .cancel)
                
                alertController.addAction(cancel)
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Are You Sure ?", message: "Are you sure you want to delete content, that you had written", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: deleteWord, style: .destructive) {
                    (action) in
                    
                    self.textView.text = ""
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
            let alert = UIAlertController(title: "\(sorryWord),", message: "But one or more of the components are empty", preferredStyle: .alert)
            let cancel = UIAlertAction(title: okWord, style: .cancel, handler: nil)
            
                    alert.setTitle(font: UIFont(name: "AvenirNext-DemiBold", size: 18), color: .none)
                    alert.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
                    alert.view.tintColor = lazyColor
                    alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    private func prepareToolBar() {
        inputTextField.inputAccessoryView   = toolBar
        textView.inputAccessoryView         = toolBar
    }
    
    @IBAction func dateChoosing(_ sender: Any) {
        if datePickerView.isHidden == true {
            datePickerView.isHidden = false
        } else {
            datePickerView.isHidden = true
        }
        timeButtonText()
        dateViewShowingAudio()
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
            dateChooseButton.setTitle("Choose Date", for: .normal)
        } else {
            dateChooseButton.setTitle("Cancel", for: .normal)
        }
    }
    
    @IBAction func dateOnTextView(_ sender: UIDatePicker) {
        let dateFormatter           = DateFormatter()
            dateFormatter.dateStyle = .medium
        
        let dateValue               = dateFormatter.string(from: sender.date)
        
        textView.text = textView.text! + dateValue
    }
    
    private func datePickerPrefering() {
        datePickerView.viewShadows()
        datePickerView.isHidden            = true
        datePickerView.layer.cornerRadius  = 14
        
        pickerViewBackground.isHidden = true
    }
    
    private func shadowsPrefering() {
        datePicker.pickerViewShadow()
        pickerViewBackground.viewShadows()
        pickerView.pickerViewShadow()
    }
    
    private func dateButtonPrefering() {
        dateChooseButton.fastButtonCostomizing(background: lazyColor, titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: "Choose Time", corner: 12, borderWidth: 2.8)
    }
    
    private func alphaPrefering() {
        let alpha = 0
        
        inputTextField.alpha = CGFloat(alpha)
        textView.alpha       = CGFloat(alpha)
    }
    
    private func sizingPrefering() {
        textViewBackgroundView.transform = CGAffineTransform(scaleX: 0, y: 0)
        textFieldView.transform          = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    private func textViews_Text_Prefering() {
        textView.text       = ""
        inputTextField.text = ""
    }
    
    private func cornersPrefering() {
        pickerViewBackground.layer.cornerRadius     = 21.68
    }
    
    private func activitiesPrefering() {
        let acTint = UIColor.darkGray
        
        textViewActivityIndicator.activityIndicatorStarts(colorOfActivity:  acTint)
        textFieldActivityIndicator.activityIndicatorStarts(colorOfActivity: acTint)
    }
    
    private func navigationItemSetup() {
        navigationItem.setTitle("Basic Notes", subtitle: "For Today")
        navigationItem.title = nil
    }
    
    private func animationsPrefering() {
        UIView.animate(withDuration: 0, delay: 0.9, options: .curveLinear, animations: {
            self.inputTextField.alpha = 1
            self.textView.alpha       = 1
        }) {(finished) in
            self.textFieldActivityIndicator.activityIndicatorStop()
            self.textViewActivityIndicator.activityIndicatorStop()
        }
    }
}

