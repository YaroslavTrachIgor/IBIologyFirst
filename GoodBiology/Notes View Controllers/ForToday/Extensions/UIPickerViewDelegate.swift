//
//  UIPickerViewDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 07.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

let articlesExamplesArray = ["Plants", "Animals", "Microbes", "Fungus", "Man", "Viruses", "Archaeas", "Biology", "Internet", "Nothing"]

extension ForTodayViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = inputTextView.text!
        
        if articlesExamplesArray[row] == "Internet" {
            inputTextField.text = "About Information From The Internet"
            if inputTextView.text == "" {
                inputTextView.text = text + " About Information From The Internet"
            } else {
                inputTextView.text = text + "," + " About Information From The Internet"
            }
        } else {
            inputTextField.text = "About \(articlesExamplesArray[row])"
            if inputTextView.text == "" {
                inputTextView.text = text + " About \(articlesExamplesArray[row])"
            } else {
                inputTextView.text = text + "," + " About \(articlesExamplesArray[row])"
            }
        }
        if articlesExamplesArray[row] == "Nothing" {
            inputTextField.text = "Nothing"
            if inputTextView.text == "" {
                inputTextView.text = text + "Today I don't want to read anything"
            } else {
                inputTextView.text = text + "," + "Today I don't want to read anything"
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        ///Check the view
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        ///Setup label
        label.textColor = UIColor.white
        label.font = UIFont(name: "AvenirNext-Medium", size: 21)
        label.textAlignment = .center
        label.text = articlesExamplesArray[row]
        
        return label
    }
}
