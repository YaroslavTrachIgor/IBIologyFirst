//
//  CardViewController.swift
//  CardViewAnimation
//
//  Created by Brian Advent on 26.10.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func addDataToInputTextView(sender: UIDatePicker!) {
        let forTodayVC = ForTodayViewController()
        
        guard let text = forTodayVC.inputTextView.text else { return }
        
        let dateFormatter           = DateFormatter()
            dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        
        forTodayVC.inputTextView.text  = text + " (" + dateValue + ")"
    }
}
