//
//  DrawNotesViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 14.02.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

class DrawNotesViewController: UIViewController {
    
    // Titles
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    
    @IBOutlet weak var brushButtonBack: ChromistaActionButtonsBack! {
        didSet {
            brushButtonBack.alpha = 1
        }
    }
    
    // UIButton
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var brushButton: UIButton!
    
    @IBOutlet weak var brushColorsContentBack: ContentBack! {
        didSet {
            brushColorsContentBack.backgroundColor = lazyColor
            brushColorsContentBack.isHidden = true
        }
    }
    @IBOutlet weak var pickerView: UIPickerView!
    
    // DrawViews
    @IBOutlet weak var headerNoteDrawView:  DrawView!
    @IBOutlet weak var noteContentDrawView: DrawView!
    
    // Colors Set Buttons
    @IBOutlet weak var colorButtonsBackView: ContentBack!
    
    // Set Stroke Colors
    @IBOutlet var setColorButtons: [UIButton]!
    
    @IBAction func setRedColor(_ sender: Any) {
        setColor(color: UIColor.systemRed.cgColor)
    }
    
    @IBAction func setBlueColor(_ sender: Any) {
        setColor(color: UIColor.systemBlue.cgColor)
    }
    
    @IBAction func setGreenColor(_ sender: Any) {
        setColor(color: UIColor.systemGreen.cgColor)
    }
    
    @IBAction func setBlackColor(_ sender: Any) {
        setColor(color: UIColor.black.cgColor)
    }
    
    @IBAction func brush(_ sender: Any) {
        if brushColorsContentBack.isHidden == true {
            brushColorsContentBack.isHidden = false
        } else {
            brushColorsContentBack.isHidden = true
        }
    }
    
    private func setColor(color: CGColor) {
        noteContentDrawView.strokeColor = color
        headerNoteDrawView.strokeColor  = color
    }
    
    // Erase
    @IBAction func onEraseTapped(_ sender: Any) {
        noteContentDrawView.erase()
        headerNoteDrawView.erase()
    }
}

struct DrawNotesViewControllerArrays {
    static let colorsArray = [UIColor.black, UIColor.purple, UIColor.white, UIColor.red, UIColor.green, UIColor.blue]
    static let colorsStringArray = ["Black", "Purple", "White", "Red", "Green", "Blue"]
    
    static let textColors = [UIColor.white, UIColor.white, UIColor.darkGray, UIColor.white, UIColor.darkGray, UIColor.white]
    static let buttonTextColors = [UIColor.white, UIColor.white, lazyColor, lazyColor, lazyColor, UIColor.white]
}

extension DrawNotesViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        headerNoteDrawView.backgroundColor  = DrawNotesViewControllerArrays.colorsArray[row]
        noteContentDrawView.backgroundColor = DrawNotesViewControllerArrays.colorsArray[row]
        
        title1.textColor = DrawNotesViewControllerArrays.textColors[row]
        title2.textColor = DrawNotesViewControllerArrays.textColors[row]
        
        eraseButton.titleLabel?.textColor = DrawNotesViewControllerArrays.buttonTextColors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        label.textColor     = UIColor.white
        label.font          = UIFont(name: "AvenirNext-Medium", size: 21)
        label.textAlignment = .center
        label.text          = DrawNotesViewControllerArrays.colorsStringArray[row]
        
        return label
    }
}

extension DrawNotesViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DrawNotesViewControllerArrays.colorsStringArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DrawNotesViewControllerArrays.colorsStringArray[row]
    }
}
