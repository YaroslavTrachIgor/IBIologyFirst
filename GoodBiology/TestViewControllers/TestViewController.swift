//
//  TestViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/17/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox

class TestViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @objc func doneButtonAction() {
        
        self.view.endEditing(true)
    }
    
    func prepareToolBar() {
        
        inputTextView.inputAccessoryView = toolBar
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
    
    @IBAction func Done(_ sender: Any)
    {
        AudioServicesPlayAlertSound(SystemSoundID(1001))
        
        let alertController = UIAlertController(title: "Good", message: "Thanks for Passing this Test", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        {
            (action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
        let theButton = sender as! UIButton
        let bounds = theButton.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            theButton.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y , width: bounds.size.width + 60, height: bounds.size.height)
        }) { (success:Bool) in
            if success
            {
                UIView.animate(withDuration: 0.5, animations:
                    {
                        theButton.bounds = bounds
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        prepareToolBar()
    }

}
