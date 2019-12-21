//
//  SecondTestPlantsViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/29/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

//MARK: Many of UI which called "plants..." are only in theirs types

extension UIButton {
    func applyDesign() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor   = UIColor.darkGray.cgColor
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
    }
}

class SecondTestPlantsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var answerLabel: UILabel!
    
    //MARK: Actions
    @IBAction func RefreshButtons(_ sender: UIBarButtonItem) {
        
        refreshing()
        refreshAudio()
    }
    
    lazy var toolBar: UIToolbar = {
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.gray
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    //MARK: Actions
    
    @IBAction func archaeaSecondFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func archaeaSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }

    @IBAction func archaeaFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func archaeaFirstTrueutton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func virusesSecondFalseButton(_ sender: UIButton) {
        
        falseButton()
        sender.flash()
    }
    
    @IBAction func virusesSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func virusesFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func virusesFirstTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func microbesSecondFalseButoon(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func microbesSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func microbesFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func microbesFirstTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func mushroomsSecondFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func mushroomsSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func mushroomsFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func mushroomsFirstTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func manSecondFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func manSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func manFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func manFirstTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func animalsSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func animalsSecondFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func AnimalsFirstTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func animalsFirstFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func plantsSecondFalseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func plantsSecondTrueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    @IBAction func falseButton(_ sender: UIButton) {
        falseButton()
        sender.flash()
    }
    
    @IBAction func trueButton(_ sender: UIButton) {
        trueButton()
        sender.flash()
    }
    
    //MARK: Public
    
    func falseButton() {
        
        answerLabel.text = "False"
        answerLabel.textColor = .red
        
        let alertController = UIAlertController(title: "False", message: "Don't worry", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func trueButton() {
        
        answerLabel.text = "True"
        answerLabel.textColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        
        let alertController = UIAlertController(title: "True", message: "You are very sweetheart", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func refreshAudio() {
        
        if (answerLabel.text == "Answer") {
            AudioServicesPlayAlertSound(1001)
        } else {
            AudioServicesPlayAlertSound(1022)
        }
    }
    
    func refreshing() {
        
        if (answerLabel.text == "Answer") {
            
            answerLabel.text = "False"
            answerLabel.textColor = .red
            
            let alertController = UIAlertController(title: "Sorry", message: "But you haven't answered yet", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default) {
                (action) in }
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        answerLabel.textColor = .black
        answerLabel.text = "Answer"
    }
    
    //MARK: Objective-C function
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    //MARK: Public
    
    func prepareToolBar() {
        falseTextView.inputAccessoryView = toolBar
        trueTextView.inputAccessoryView = toolBar
    }
    
    //MARK: IBOutlets
    
    @IBOutlet weak var trueTextView: UITextView!
    @IBOutlet weak var falseTextView: UITextView!
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareToolBar()
    }
}
