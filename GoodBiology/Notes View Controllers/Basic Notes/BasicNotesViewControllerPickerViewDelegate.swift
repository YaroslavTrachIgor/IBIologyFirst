//
//  PickerViewDelegate .swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

extension BasicNotesViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = textView.text!
        
        if articlesArray[row] == "Internet" {
            inputTextField.text = "About Information From The Internet"
            if textView.text == "" {
                textView.text = text + " About Information From The Internet"
            } else {
                textView.text = text + "," + " About Information From The Internet"
            }
        } else {
            inputTextField.text = "About \(articlesArray[row])"
            if textView.text == "" {
                textView.text = text + " About \(articlesArray[row])"
            } else {
                textView.text = text + "," + " About \(articlesArray[row])"
            }
        }
        
        if articlesArray[row] == "Nothing" {
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
        label.text = articlesArray[row]
        
        return label
    }
}

extension BasicNotesViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return articlesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return articlesArray[row]
    }
}

