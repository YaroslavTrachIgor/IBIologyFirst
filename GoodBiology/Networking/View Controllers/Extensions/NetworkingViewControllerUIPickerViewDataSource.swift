//
//  NetworkingViewControllerUIPickerViewDataSource.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

internal extension NetworkingViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if sytesMenuArray[row] == "Wikipedia" {
            urlAnimation(url: "https://www.wikipedia.org")
        } else if sytesMenuArray[row] == "YouTube About Plants" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=plants")
        } else if sytesMenuArray[row] == "YouTube About Animals" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=animals+seince")
        } else if sytesMenuArray[row] == "YouTube About Microbes" {
            urlAnimation(url: "https://www.youtube.com/results?search_query=microbes")
        } else {
            urlAnimation(url: "https://www.\(self.sytesMenuArray[row]).com")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        viewModel.labelPickerViewSetup(label, text: sytesMenuArray[row])
        
        if sytesMenuArray[row] == "YouTube About Animals" || sytesMenuArray[row] == "YouTube About Microbes" || sytesMenuArray[row] == "YouTube About Plants"{
            label.font = UIFont(name: "AvenirNext-Medium", size: 15.1)
        }
        return label
    }
}
