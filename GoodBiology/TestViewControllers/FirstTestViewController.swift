//
//  FirstTestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/29/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

//MARK: Many of UI which called "plants..." are only in theirs types

extension UIView {
    func shadows() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 11
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

class FirstTestViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var plantsFirstOutletButton: UIButton!
    @IBOutlet weak var plantsSecondOutletButton: UIButton!
    
    @IBOutlet weak var animalsFirstOutletButton: UIButton!
    @IBOutlet weak var animalsSecondOutletButton: UIButton!
    
    @IBOutlet weak var manFirstOutletButton: UIButton!
    @IBOutlet weak var manSecondOutletButton: UIButton!
    
    @IBOutlet weak var mushroomsFirstOutletButton: UIButton!
    @IBOutlet weak var mushroomsSecondOutletButton: UIButton!
    
    @IBOutlet weak var microbesFirstOutletButton: UIButton!
    @IBOutlet weak var microbesSecondOutletButton: UIButton!
    
    @IBOutlet weak var archaeaFirstOuletButton: UIButton!
    @IBOutlet weak var archaeaSecondOutletButton: UIButton!
    
    @IBOutlet weak var virusesSecondOutletButton: UIButton!
    @IBOutlet weak var virusesFirstOutlenButton: UIButton!
    
    func audioAction() {
        AudioServicesPlayAlertSound(1003)
    }
    
    // Share Buttons
    func refreshing() {
        if (AnswerLabel.text == "Answer") {
            
            AnswerLabel.text = "False"
            AnswerLabel.textColor = .red
            
            let alertController = UIAlertController(title: "Sorry", message: "Sorry but you haven't answered yet", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default) {
                (action) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
        AnswerLabel.textColor = .black
        AnswerLabel.text = "Answer"
        
        if (AnswerLabel.text == "Answer") {
            AudioServicesPlayAlertSound(1001)
        } else {
            AudioServicesPlayAlertSound(1022)
        }
    }
    
    //MARK: Refreshing functions
    //MARK: Actions
    
    @IBAction func mushroomsRefresh(_ sender: Any) { refreshing() }
    @IBAction func manRefresh(_ sender: Any) { refreshing() }
    @IBAction func AnimalsRefresh(_ sender: Any) { refreshing() }
    @IBAction func Refresh(_ sender: Any) { refreshing() }
    
    lazy var toolBar: UIToolbar = {
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.gray
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    //MARK: IBOutlets
    
    @IBOutlet weak var falseTexView: UIButton!
    @IBOutlet weak var TrueTextView: UITextView!
    @IBOutlet weak var FalsetextView: UITextView!
    @IBOutlet weak var AnswerLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func microbesFirstAnswer(_ sender: UIButton) {
        
        AnswerLabel.text = "False"
        AnswerLabel.textColor = .red
        
        sender.flash()
        
        let alertController = UIAlertController(title: "False", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func microbesSecondAnswer(_ sender: UIButton) {
        
        AnswerLabel.text = "True"
        AnswerLabel.textColor = (#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
        
        sender.flash()
        
        let alertController = UIAlertController(title: "False", message: "Think still", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func FirstAnswer(_ sender: UIButton) {
        
        AnswerLabel.text = "False"
        AnswerLabel.textColor = .red
        
        sender.flash()
        
        let alertController = UIAlertController(title: "False", message: "Think still", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func SecondAnswer(_ sender: UIButton) {
        AnswerLabel.text = "True"
        AnswerLabel.textColor = (#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
        
        sender.flash()
        
        let alertController = UIAlertController(title: "True", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (action) in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Objective-C function
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    //MARK: Public
    
    func prepareToolBar() {
        
        TrueTextView.inputAccessoryView = toolBar
        FalsetextView.inputAccessoryView = toolBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareToolBar()
    }
}
