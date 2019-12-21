//
//  ThirdTestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/29/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

class ThirdTestViewController: UIViewController {

    @IBOutlet weak var FalseTetView: UITextView!
    @IBOutlet weak var FalseTextView: UITextView!
    
    lazy var toolBar: UIToolbar = {
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.gray
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.items = [spacer, doneButton]
        
        return toolBar
    }()
    
    @IBAction func TrueButton(_ sender: Any) {
        
        AnswerLabel.text = "False"
        AnswerLabel.textColor = .red
    }
    
    @IBAction func FalseButton(_ sender: Any) {
        
        AnswerLabel.text = "True"
        AnswerLabel.textColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
    }
    
    @IBOutlet weak var AnswerLabel: UILabel!
 
    @objc func doneButtonAction() {
        
        self.view.endEditing(true)
    }
    
    func prepareToolBar() {
        
        FalseTextView.inputAccessoryView = toolBar
        FalseTextView.inputAccessoryView = toolBar
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        prepareToolBar()
    }
    
}
